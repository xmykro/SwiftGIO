s/\(.*g_socket_.*\)gint.flags.,\(.*\)/\1gint(flags.rawValue),\2/
s/, GObject.TypePluginProtocol//
s/func listActions() -> UnsafeMutablePointer<UnsafeMutablePointer<gchar>/func listActions() -> UnsafePointer<UnsafePointer<gchar>/
