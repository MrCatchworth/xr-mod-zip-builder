if [ $1 = "clean" ]; then
    rm -r -I build/*
    exit 0
fi

extPath=$1
extBaseName=$(basename $extPath)
catTool="../../../X Rebirth Tools/XRCatTool"
contentPath=

if test ! -d $extPath; then
    echo "$extPath does not exist"
    exit 1
fi

if test -f $extPath/.build/content_steam.xml; then
    contentPath=$extPath/.build/content_steam.xml
else
    contentPath=$extPath/content.xml
fi
echo "Using content file $contentPath"

if test -f $extPath/.build/cat_exclude.txt; then
    extraExclude=$(cat $extPath/.build/cat_exclude.txt)
    echo "Using extra exclusion filters from $extPath/.build/cat_exclude.txt: $extraExclude"
fi

if test ! -f $contentPath; then
    echo "$extPath does not have a content.xml! Are you sure this is an extension folder?"
    exit 1
fi

test ! -e build && (echo "Creating non-existent build output directory"; mkdir build)
test ! -e build/$extBaseName && mkdir build/$extBaseName

outPath=build/$extBaseName

"$catTool" -in $extPath -out $outPath/ext_01.cat -include "^.+" -exclude "^[\._]" "^content.xml$" "^readme" "\.txt$" $extraExclude
cp $contentPath $outPath
cp $extPath/*.txt $outPath