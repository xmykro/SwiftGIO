s/\(.*g_socket_.*\)gint.flags.,\(.*\)/\1gint(flags.rawValue),\2/
s/, GObject.TypePluginProtocol//
