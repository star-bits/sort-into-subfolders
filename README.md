# Sort files into subfolders 

## Sort by date created

Run shell script:
```shell
sh sort-by-created.sh
```

Or run in terminal:
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

Or run in terminal:
```shell
for f in *; do
    dir=$(stat -f%Sm -t%Y-%m-%d "$f")
    echo $f '->' $dir
    [ -d "$dir" ] || mkdir "$dir"
    mv "$f" "$dir"/
done
```


## Sort by content created (EXIF metadata)

First install [exiftool](https://exiftool.org/)

Run shell script:
```shell
sh sort-by-exif.sh
```

Or run in terminal:
```shell
exiftool -d %Y-%m-%d "-directory<datetimeoriginal" "$(dirname "$0")"
```
