testurl="http://localhost:8081/SpringBootstrapCrud"
testauth="test:test"
curl -s -w "\n" -X GET "$testurl/" -u "$testauth" >> e2etest.txt
curl -s -w "\n" -X GET "$testurl/somerandomurl" -u "$testauth" >> e2etest.txt
curl -s -w "\n" -X GET "$testurl/testRead" -u "$testauth" >> e2etest.txt
curl -s -w "\n" -X GET "$testurl/testRead1" -u "$testauth" >> e2etest.txt
curl -s -w "\n" -X GET "$testurl/testRead2" -u "$testauth" >> e2etest.txt
curl -s -w "\n" -X GET "$testurl/testRead3?name=Dave" -u "$testauth" >> e2etest.txt
curl -s -w "\n" -X GET -G "$testurl/testRead3" -d "name=Dave" -u "$testauth" >> e2etest.txt

cmp -s e2etest.txt expectede2etest.txt && echo "End to end test passed" || echo "End to end test failed"

