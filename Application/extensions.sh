exts="sh py json txt java"

extensions=".*\.sh"
for extension in $exts
do
extensions+="|.*\.$extension"
done
