#!/bin/sh
echo -e "\n\n Installing Fonts "
curl  -L https://www.dropbox.com/sh/2b5v9edptphmspy/AACtY_bL_KWbTlNYz1aCi2Kla\?dl=1 -o fonts.tar.gz
echo -e "Extracting font files"
mkdir fonts
tar -zxf fonts.tar.gz -C fonts
mv fonts/*  ~/Library/Fonts/
echo -e "\n\n Font Installed , cleaning files"
pwd
rm -rf fonts
rm -rf fonts.tar.gz
