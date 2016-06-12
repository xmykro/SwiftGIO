s/GLib.Type/GType/g
s/GLib.CompareFunc/GCompareFunc/g
s/GLib.CompareDataFunc/GCompareDataFunc/g
s/.*no reference counting for GFile, cannot ref.*/	g_object_ref(cast(ptr))/
s/.*no reference counting for GFile, cannot unref.*/	g_object_unref(cast(ptr))/
s/.*no reference counting for GAppInfo, cannot ref.*/	g_object_ref(cast(ptr))/
s/.*no reference counting for GAppInfo, cannot unref.*/	g_object_unref(cast(ptr))/
