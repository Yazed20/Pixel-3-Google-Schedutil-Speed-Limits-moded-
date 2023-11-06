SKIPMOUNT=false
PROPFILE=false
POSTFSDATA=false
LATESTARTSERVICE=true

on_install() {
  unzip -o "$ZIPFILE" 'system/*' -d $MODPATH >&2
}

print_modname() {
  ui_print "*******************************"
  ui_print "  Tweaked by me yazed thx to @nonosvaimos   "
  ui_print "*******************************"

  ui_print "*******************************"

  ui_print "  Installing Started "
  ui_print ""                      
 
}

set_permissions() {
  set_perm_recursive "$MODPATH" 0 0 0755 0644
  set_perm_recursive "$MODPATH/system" 0 0 0755 0644
  set_perm_recursive "$MODPATH/system/xbin" 0 0 0755 0644
  set_perm_recursive "$MODPATH/system/bin" 0 0 0755 0755
}


