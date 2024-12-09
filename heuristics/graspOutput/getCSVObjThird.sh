
echo "a,b"
dir=$(dirname "$(realpath "$0")")
for f in $(ls $dir/graspIter3* | sort -V)
do
    num=$(basename "$f" | grep -oE '[0-9]+' | awk 'NR==2')
    t=$(grep "OBJECTIVE" "$f" | grep -oE '[0-1]\.[0-9]+')

    if [[ -z "$t" ]]; then
        t="0.00"
    fi
    echo "$t,$num"
done
