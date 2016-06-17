s/GLib.Type/GType/g
s/GLib.CompareFunc/GCompareFunc/g
s/GLib.CompareDataFunc/GCompareDataFunc/g
s/public func (parseName parse_name:/public func parse(name parse_name:/
s/.*no reference counting for GFile, cannot ref.*/	g_object_ref(cast(ptr))/
s/.*no reference counting for GFile, cannot unref.*/	g_object_unref(cast(ptr))/
s/.*no reference counting for GAppInfo, cannot ref.*/	g_object_ref(cast(ptr))/
s/.*no reference counting for GAppInfo, cannot unref.*/	g_object_unref(cast(ptr))/
s/Pem(pem/(PEM/
s/Ssl/SSL/g
s/Tls/TLS/g
s/GTLS/GTls/g
s/Ucs/UCS/g
s/Uri/URI/g
s/Utc/UTC/g
s/Utf/UTF/g
s/Id/ID/g
s/IDle/Idle/g
s/IDent/Ident/g
