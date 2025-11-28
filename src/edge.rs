use std::path::PathBuf;
use std::{env, fs};
use zed::lsp::{Completion, CompletionKind};
use zed::settings::LspSettings;
use zed::CodeLabelSpan;
use zed_extension_api::{self as zed, serde_json, Result};

const SERVER_PATH: &str = "node_modules/edge-language-server/out/server.js";
const EDGE_LANGUAGE_SERVER_PACKAGE_NAME: &str = "edge-language-server";

struct EdgeExtension {
    did_find_server: bool,
}

impl EdgeExtension {
    #[allow(dead_code)]
    pub const LANGUAGE_SERVER_ID: &'static str = "edge-language-server";

    fn file_exists_at_path(&self, path: &str) -> bool {
        fs::metadata(path).map_or(false, |stat| stat.is_file())
    }

    fn server_script_path(&mut self, language_server_id: &zed::LanguageServerId) -> Result<String> {
        // Only handle the Edge language server, let Zed handle HTML and Emmet
        if language_server_id.as_ref() != "edge-language-server" {
            return Err(format!("Unsupported language server: {}", language_server_id.as_ref()).into());
        }

        let server_exists = self.file_exists_at_path(&SERVER_PATH);

        if self.did_find_server && server_exists {
            zed::set_language_server_installation_status(
                language_server_id,
                &zed::LanguageServerInstallationStatus::CheckingForUpdate,
            );
        }

        zed::set_language_server_installation_status(
            language_server_id,
            &zed::LanguageServerInstallationStatus::Downloading,
        );

        // Always install latest version
        self.install_server()?;

        if !self.file_exists_at_path(&SERVER_PATH) {
            return Err(format!(
                "Installed package '{}' did not contain expected path '{}'",
                EDGE_LANGUAGE_SERVER_PACKAGE_NAME, SERVER_PATH
            )
            .into());
        }

        self.did_find_server = true;
        Ok(SERVER_PATH.to_string())
    }

    fn install_server(&mut self) -> Result<()> {
        // Always resolve and install the latest version
        let version = zed::npm_package_latest_version(EDGE_LANGUAGE_SERVER_PACKAGE_NAME)
            .map_err(|e| format!("Failed to resolve latest version: {}", e))?;

        println!(
            "Installing {}@{}",
            EDGE_LANGUAGE_SERVER_PACKAGE_NAME, version
        );

        // Let npm handle the update/replacement of existing packages
        zed::npm_install_package(EDGE_LANGUAGE_SERVER_PACKAGE_NAME, &version).map_err(|error| {
            format!(
                "Failed to install package '{}': {}",
                EDGE_LANGUAGE_SERVER_PACKAGE_NAME, error
            )
        })?;

        Ok(())
    }
}

impl zed::Extension for EdgeExtension {
    fn new() -> Self {
        Self {
            did_find_server: false,
        }
    }

    fn language_server_command(
        &mut self,
        language_server_id: &zed::LanguageServerId,
        _worktree: &zed::Worktree,
    ) -> Result<zed::Command> {
        let server_path = self.server_script_path(language_server_id)?;
        let current_dir = env::current_dir().unwrap_or(PathBuf::new());
        let full_path_to_server = zed_ext::sanitize_windows_path(current_dir).join(&server_path);

        let args = vec![
            full_path_to_server.to_string_lossy().to_string(),
            "--stdio".to_string(),
        ];

        Ok(zed::Command {
            command: zed::node_binary_path()?,
            args,
            env: Default::default(),
        })
    }

    fn language_server_initialization_options(
        &mut self,
        language_server_id: &zed::LanguageServerId,
        worktree: &zed::Worktree,
    ) -> Result<Option<serde_json::Value>> {
        if language_server_id.as_ref() == "edge-language-server" {
            let settings = LspSettings::for_worktree("edge-language-server", worktree)
                .ok()
                .and_then(|lsp_settings| lsp_settings.initialization_options.clone())
                .unwrap_or_default();
            Ok(Some(settings))
        } else {
            // For HTML and Emmet, return None to let Zed handle default initialization
            Ok(None)
        }
    }

    fn language_server_workspace_configuration(
        &mut self,
        language_server_id: &zed::LanguageServerId,
        worktree: &zed::Worktree,
    ) -> Result<Option<serde_json::Value>> {
        if language_server_id.as_ref() == "edge-language-server" {
            let mut settings = LspSettings::for_worktree("edge-language-server", worktree)
                .ok()
                .and_then(|lsp_settings| lsp_settings.settings.clone())
                .unwrap_or_default();

            // Add default formatting configuration if not provided
            if let serde_json::Value::Object(ref mut map) = settings {
                // Ensure formatting is enabled by default
                if !map.contains_key("formatting") {
                    map.insert(
                        "formatting".to_string(),
                        serde_json::json!({
                            "enabled": true,
                            "printWidth": 80,
                            "tabWidth": 2,
                            "useTabs": false,
                            "singleQuote": true,
                            "trailingComma": "none"
                        }),
                    );
                }
            } else {
                // If settings is not an object, create a new one with formatting config
                settings = serde_json::json!({
                    "formatting": {
                        "enabled": true,
                        "printWidth": 80,
                        "tabWidth": 2,
                        "useTabs": false,
                        "singleQuote": true,
                        "trailingComma": "none"
                    }
                });
            }

            Ok(Some(settings))
        } else {
            // For HTML and Emmet, return None to let Zed handle default configuration
            Ok(None)
        }
    }

    fn label_for_completion(
        &self,
        language_server_id: &zed::LanguageServerId,
        completion: Completion,
    ) -> Option<zed::CodeLabel> {
        // Only provide custom completion labels for the Edge language server
        // For HTML and Emmet, let Zed use its default handling
        if language_server_id.as_ref() != "edge-language-server" {
            return None;
        }

        let highlight_name = match completion.kind? {
            CompletionKind::Class | CompletionKind::Interface => "type",
            CompletionKind::Constructor => "constructor",
            CompletionKind::Constant => "constant",
            CompletionKind::Function | CompletionKind::Method => "function",
            CompletionKind::Property | CompletionKind::Field => "property",
            CompletionKind::Variable => "variable",
            CompletionKind::Keyword => "keyword",
            CompletionKind::Enum => "enum",
            CompletionKind::Module => "module",
            _ => return None,
        };

        let len = completion.label.len();
        let name_span = CodeLabelSpan::literal(completion.label, Some(highlight_name.to_string()));

        let spans = if let Some(detail) = completion.detail {
            vec![
                name_span,
                CodeLabelSpan::literal(" ", None),
                CodeLabelSpan::literal(detail, Some("detail".to_string())),
            ]
        } else {
            vec![name_span]
        };

        Some(zed::CodeLabel {
            code: Default::default(),
            spans,
            filter_range: (0..len).into(),
        })
    }
}

zed::register_extension!(EdgeExtension);

/// Extensions to the Zed extension API that have not yet stabilized.
mod zed_ext {
    pub fn sanitize_windows_path(path: std::path::PathBuf) -> std::path::PathBuf {
        use zed_extension_api::{current_platform, Os};

        let (os, _arch) = current_platform();
        match os {
            Os::Mac | Os::Linux => path,
            Os::Windows => path
                .to_string_lossy()
                .to_string()
                .trim_start_matches('/')
                .into(),
        }
    }
}
