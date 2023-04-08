for f in *; do
    if [ "$f" != "sort-by-modified.sh" ]; then
        dir=$(stat -f%Sm -t%Y-%m-%d "$f")
        echo $f '->' $dir
        [ -d "$dir" ] || mkdir "$dir"
        mv "$f" "$dir"/
    fi
done