echo "Preparing data to generate build"

mkdir -p processing && rm -rf processing && mkdir -p processing
cp -r *data/*data/* processing/
cp -r process*data.sh processing/

echo "Processing data"

processdatascripts=$(ls | grep "process*data.sh" | xargs)
for processdatascript in 

cd processing && 

mkdir -p build && rm -rf build && mkdir -p build

echo "Processing data"

cd metaprocessor && processdata.sh && cd ..

echo "Running Meta processor tests"

cd metaprocessor/tests && sh runtests.sh && cd ../..

echo "Remaking directories"

cd metaprocessor && sh remakedirectories.sh && cd ..

echo "Sourcing extensions for adding variables"

cd metaprocessor && source extensions.sh && cd ..

echo "Finding variables"

tree -af appdata | grep -E $extensions | sed "s/[^[:alnum:]./_]//g" > metaprocessor/files.txt
cat metaprocessor/additionalfiles.txt >> metaprocessor/files.txt

echo "Preparing compiled folder"

cp -r appdata/* compiled/
cp -r compiled/bashscriptdata/* compiled/

echo "Adding variables"

python addvariables.py

echo "Meta processor added variables"

cd compiled && sh compileappdata.sh && cd workspace/* && sh run_build.sh && cd ../../..

echo "Workspace is ready"

cp compiled/workspace/*/build/libs/*SNAPSHOT.* Application/build/libs
cp compiled/workspace/*/*.sh Application
cp -r apache-tomcat-*/* Application/apache-tomcat/
cp -r compiled/workspace/tomcatdata/* Application/apache-tomcat/conf/
cp -r compiled/workspace/nginx/* Application/

buildnames=$(ls compiled/workspace/*/build/libs)
for buildname in $buildnames
do
	shortname="${buildname/-*/}.${buildname/*./}"
	cp "Application/build/libs/$buildname" "Application/build/libs/$shortname"
	cp "Application/build/libs/$buildname" "Application/apache-tomcat/webapps/$shortname"
done


echo "Application is ready"

#now run application

