use zed_extension_api as zed;

struct EdgeExtension;

impl zed::Extension for EdgeExtension {
    fn new() -> Self
    where
        Self: Sized,
    {
        Self
    }
}

zed::register_extension!(EdgeExtension);