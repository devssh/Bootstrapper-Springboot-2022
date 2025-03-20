echo "Running Meta processor tests"

cd tests && sh runtests.sh && cd ..

echo "Remaking directories"

sh remakedirectories.sh

echo "Sourcing extensions for adding variables"

cd metaprocessor && source extensions.sh && cd ..

