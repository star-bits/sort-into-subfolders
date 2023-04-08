# Sort files into subfolders 

Move the `.sh` file into the folder containing the files to be sorted. Navigate to the folder using Terminal.

## Sort by date created

Run shell script:
```shell
sh sort-by-created.sh
```

Or directly in Terminal:
```shell
for f in *; do
    dir=$(stat -f%SB -t%Y-%m-%d "$f")
    echo $f '->' $dir
    [ -d "$dir" ] || mkdir "$dir"
    mv "$f" "$dir"/
done
```

## Sort by date modified

Run shell script:
```shell
sh sort-by-modified.sh
```

Or directly in Terminal:
```shell
for f in *; do
    dir=$(stat -f%Sm -t%Y-%m-%d "$f")
    echo $f '->' $dir
    [ -d "$dir" ] || mkdir "$dir"
    mv "$f" "$dir"/
done
```


## Sort by content created (EXIF metadata)

Install [exiftool](https://exiftool.org/)

Run shell script:
```shell
sh sort-by-exif.sh
```

Or directly in Terminal:
```shell
exiftool -d %Y-%m-%d "-directory<datetimeoriginal" $PWD
```
