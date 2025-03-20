#echo "Running pre execution tests - failsafe"
sh clean.sh
echo "Cleaned the workspace"

echo "Running pre execution tests"
sh testbootstrapper.sh
#add condition to halt if test fails
#if [["$var"=="abc" && "$var2"=="def"]]; then
#exit
#fi

cp -r bootstrapdata processing && cd processing && mv bootstrapdata ??{projectname} && cd ..

cd processing/??{projectname}/src/main/java && mv projectname ??{projectname}
cd ??{projectname} && mv projectnameApplication.java ??{projectname}Application.java && cd ../../../../../..
cd processing/??{projectname}/src/test/java && mv projectname ??{projectname}
cd ??{projectname} && mv projectnameApplicationTests.java ??{projectname}ApplicationTests.java && cd ../../../../../..

cp -r processing/??{projectname} workspace
cp -r tomcatdata workspace/
cp -r nginxdata workspace/
cp -r osdata workspace/
cp -r docker workspace/

echo "Running post clean"
sh postclean.sh
