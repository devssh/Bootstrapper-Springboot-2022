testurl="crudbackend"
testauth="test:test"
curl -s -w "\n" -X GET "$testurl/" -u "$testauth" >> failne2etest.txt

cmp -s failne2etest.txt expectedfaile2etest.txt && echo "End to end 50x test passed" || echo "End to end 50x test failed"

