for f in *; do
    dir=$(stat -f%Sm -t%Y-%m-%d "$f")
    echo $f '->' $dir
    [ -d "$dir" ] || mkdir "$dir"
    mv "$f" "$dir"/
done