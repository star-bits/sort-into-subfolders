for f in *; do
    if [ "$f" != "sort-by-created.sh" ]; then
        dir=$(stat -f%SB -t%Y-%m-%d "$f")
        echo $f '->' $dir
        [ -d "$dir" ] || mkdir "$dir"
        mv "$f" "$dir"/
    fi
done