rm -rf ne2etest.txt
testurl=crudbackend
testauth=test:test
curl -s -w "\n" -X GET "$testurl/" -u "$testauth" >> ne2etest.txt
curl -s -w "\n" -X GET "$testurl/somerandomurl" -u "$testauth" >> ne2etest.txt
curl -s -w "\n" -X GET "$testurl/testRead" -u "$testauth" >> ne2etest.txt
curl -s -w "\n" -X GET "$testurl/testRead1" -u "$testauth" >> ne2etest.txt
curl -s -w "\n" -X GET "$testurl/testRead2" -u "$testauth" >> ne2etest.txt
curl -s -w "\n" -X GET "$testurl/testRead3?name=Dave" -u "$testauth" >> ne2etest.txt
curl -s -w "\n" -X GET -G "$testurl/testRead3" -d "name=Dave" -u "$testauth" >> ne2etest.txt

cmp -s ne2etest.txt expectede2etest.txt && echo "End to end nginx test passed" || echo "End to end nginx test failed"

