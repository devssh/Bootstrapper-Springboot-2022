mkdir -p compiled
rm -rf compiled
mkdir compiled

cp ../runreplacement.py  runreplacement.py

python merge.py

python runreplacement.py > testresults.txt


passcount=$(cat testresults.txt | grep "passed" | wc -l | xargs)
totalcount=3

echo "$passcount metaprocessor tests passed out of $totalcount"


