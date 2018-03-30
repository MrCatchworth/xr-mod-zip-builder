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

listName=$hereName/7z_build_exclude.txt

cd ..

if 7z a -xr@$listName $hereName/$archiveName $extName; then
	echo "Build Done"
else
	echo "Build Failed! ==========="
fi

read

