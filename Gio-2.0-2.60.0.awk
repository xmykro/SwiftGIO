#!/usr/bin/awk
#
# Patch the generated wrapper Swift code to handle special cases
#
BEGIN { noimm = 0 }
/additional application actions/ {
	noimm = 1
}
/func listActions() -> UnsafeMutablePointer<UnsafeMutablePointer<gchar>/ {
	if (noimm == 0) {
		gsub("UnsafeMutablePointer<UnsafeMutablePointer<gchar>", "UnsafePointer<UnsafePointer<gchar>")
	}
	noimm = 0
}
/^$/ {
	noimm = 0
}
// { print }
