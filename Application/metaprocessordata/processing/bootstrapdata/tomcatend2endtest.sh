testurl="http://localhost:??{port}/??{projectname}"
testauth="??{username}:??{password}"
curl -w "\n" -X GET "$testurl/" -u "$testauth"
curl -w "\n" -X GET "$testurl/somerandomurl" -u "$testauth"
curl -w "\n" -X GET "$testurl/testRead" -u "$testauth"
curl -w "\n" -X GET "$testurl/testRead1" -u "$testauth"
curl -w "\n" -X GET "$testurl/testRead2" -u "$testauth"
curl -w "\n" -X GET "$testurl/testRead3?name=Dave" -u "$testauth"
curl -w "\n" -X GET -G "$testurl/testRead3" -d "name=Dave" -u "$testauth"
