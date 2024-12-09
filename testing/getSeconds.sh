for f in $(ls *Time*) 
do
    echo $f
    touch aux.txt
    python3 csvTreatment.py $f > aux.txt
    mv aux.txt $f
done
