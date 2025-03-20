touch testreport.txt
rm testreport.txt

pythonservicetests=$(ls pythonservice | grep ".*\.py")
for test in $pythonservicetests
do
python pythonservice/$test > testreport.txt
done

var=$(cat testreport.txt | grep "test passed" | wc -l | xargs)
totaltests=1
if [[ "$var"=="$totaltests" ]]; then
echo "All tests passed"
else
echo "Some tests have failed"
fi

echo "$var tests passed out of $totaltests"
