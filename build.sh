extName=$1

if test ! -d ../$extName; then
    echo "$extName does not exist or is not a directory"
    exit 1
fi

echo "Attempting to build zip for $extName"

archiveName=${extName}_$(date +%Y-%m-%d).zip
hereName=$(basename "$(pwd)")

if test -f $archiveName; then
    rm -v $archiveName
fi

if test -f ../$extName/7z_build_exclude.txt; then
    echo "$extName has its own exclusion listfile"
    listName=$extName/7z_build_exclude.txt
else
    echo "$extName does NOT have its own exclusion listfile, using the global one"
    listName=$hereName/7z_build_exclude.txt
fi

cd ..

if 7z a -xr@$listName $hereName/$archiveName $extName; then
	echo "Build Done"
else
	echo "Build Failed! ==========="
fi

read

