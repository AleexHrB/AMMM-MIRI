
dir=$(dirname "$(realpath "$0")")
echo "a,b"
for f in $(ls $dir/graspIter3* | sort -V)
do
    num=$(basename "$f" | grep -oE '[0-9]+' | awk 'NR==2')
    t=$(grep "real" "$f" | grep -oE '[0-9]+m[0-9]+\.[0-9]+s')
    echo "$t,$num"
done
