echo "Running Meta processor tests"

cd tests && sh runtests.sh && cd ..

touch files.txt
rm -rf files.txt
rm -rf Application
mkdir -p Application
rm -rf compiled
mkdir -p compiled
rm -rf Application
mkdir -p Application/build
mkdir -p Application/build/libs
mkdir -p Application/apache-tomcat

source extensions.sh

tree -af appdata | grep -E $extensions | sed "s/[^[:alnum:]./_-]//g" > files.txt
cat additionalfiles.txt >> files.txt
cp -r appdata/* compiled/
python runreplacement.py

echo "Meta processor finished compilation"

cd compiled && sh createspringbootstrap.sh && cd workspace/* && sh run_build.sh && cd ../../..

#createspringbootstrap.sh will create workspace. Only workspace files go to Application

cp compiled/workspace/*/build/libs/*SNAPSHOT.* Application/build/libs
cp compiled/workspace/*/*.sh Application
cp compiled/workspace/tomcatdata/*.txt Application/
cp -r compiled/workspace/tomcatdata/apache-tomcat-*/* Application/apache-tomcat/
cp -r compiled/workspace/tomcatdata/conf/* Application/apache-tomcat/conf/
cp -r compiled/workspace/nginxdata/* Application/
cp -r compiled/workspace/osdata/* Application/
cp -r compiled/workspace/docker/nginx/* Application/

buildnames=$(ls compiled/workspace/*/build/libs)
for buildname in $buildnames
do
	shortname="${buildname/-*/}.${buildname/*./}"
	cp "Application/build/libs/$buildname" "Application/build/libs/$shortname"
	cp "Application/build/libs/$buildname" "Application/apache-tomcat/webapps/$shortname"
done


echo "Created Spring bootstrap, Tomcat is ready, Nginx is ready"

#cd Application && sh compose.sh
cd Application && sh loadnginxconfig.sh && sh run_tomcat_prod.sh


