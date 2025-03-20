#echo "Running pre execution tests - failsafe"
sh clean.sh
echo "Cleaned the workspace"

echo "Running pre execution tests"
sh testbootstrapper.sh
#add condition to halt if test fails
#if [["$var"=="abc" && "$var2"=="def"]]; then
#exit
#fi

cp -r bootstrapdata processing && cd processing && mv bootstrapdata SpringBootstrapCrud && cd ..

cd processing/SpringBootstrapCrud/src/main/java && mv projectname SpringBootstrapCrud
cd SpringBootstrapCrud && mv projectnameApplication.java SpringBootstrapCrudApplication.java && cd ../../../../../..
cd processing/SpringBootstrapCrud/src/test/java && mv projectname SpringBootstrapCrud
cd SpringBootstrapCrud && mv projectnameApplicationTests.java SpringBootstrapCrudApplicationTests.java && cd ../../../../../..

cp -r processing/SpringBootstrapCrud workspace
cp -r tomcatdata workspace/
cp -r nginxdata workspace/
cp -r osdata workspace/
cp -r docker workspace/

echo "Running post clean"
sh postclean.sh
