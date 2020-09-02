#!/bin/sh
echo "process theme for persistance"
D_PUBLIC=/var/www/html/public
D_THEME=$D_PUBLIC/theme
D_BAK_THEME=$D_PUBLIC/back_theme
D_PST_THEME=$D_PUBLIC/pst_theme
F_THEME_PROCED=$D_THEME/processed.pt
if [ -d "$D_PST_THEME" -a -d "$D_THEME" -a ! -d "$D_BAK_THEME" ]; then
	echo "run D_PST_THEME"
	mv $D_THEME $D_BAK_THEME
	ln -s $D_PST_THEME $D_THEME
    if [ ! -f "$F_THEME_PROCED" ]; then
		echo "run F_THEME_PROCED"
    	cp -r $D_BAK_THEME/* $D_PST_THEME/
    	touch $F_THEME_PROCED
    fi
fi