Two small bash scripts that help automate publishing of mods for X:Rebirth. One creates zip files (for Nexus/other file hosts), the other creates a cat/dat pair (for Steam Workshop). subst_XX files are not supported yet.

Both scripts must be run with the script's own folder as the working directory. The folder which this repository represents must be placed in the 'extensions' folder, as a sibling to to the extension folders installed.

These scripts are only tested running under Cygwin on Windows, but hopefully they work just the same in real Linux bash.

## build.sh
Usage:\
`build.sh <extension foler name>`\
Example: `build.sh mej_improved_object_menu`

7z must be available on PATH. A zip file is generated in the script's folder, with the given extension folder and today's date. Use "7z_build_exclude.txt" to customise what is excluded from going in the zip file, if desired.

## wsbuild.sh
Usage:\
`wsbuild.sh <path_to_extension>`\
`wsbuild.sh clean` (to remove everything from the 'build' folder)
       
Example: `wsbuild.sh ../mej_improved_object_menu`

X Rebirth Tools must be installed on Steam. Generates ext_01.cat/dat under the "build/extension_folder_name", along with the extension's content.xml.

This tool doesn't automate anything to do with WorkshopTool, but the idea is that the output from wsbuild.sh should be ready to use with WorkshopTool without any further meddling.

Some customisation is possible using files in "<path_to_extension>/.build".

### content_steam.xml
This should be a valid content.xml file, but this is the one you'd use for Steam (with the Workshop ID and such). Wsbuild.exe will copy this file to the output folder, if it exists, instead of the usual one.

### cat_exclude.txt
This should be regular patterns separated by spaces. If this file exists, wsbuild.sh will add these patterns to the list of exclusions when generating the cat/dat.
