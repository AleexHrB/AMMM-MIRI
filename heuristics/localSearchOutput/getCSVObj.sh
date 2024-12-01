
dir=$(dirname "$(realpath "$0")")
echo "a,b"
for f in $(ls $dir/localSearchIter1* | sort -V)
do
    num=$(basename "$f" | grep -oE '[0-9]+' | awk 'NR==2')
    t=$(grep "OBJECTIVE" "$f" | grep -oE '[0-1]\.[0-9]+')

    if [[ -z "$t" ]]; then
        t="0.00"
    fi
    echo "$t,$num"
done
