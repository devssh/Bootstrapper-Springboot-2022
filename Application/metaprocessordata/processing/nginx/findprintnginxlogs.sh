#nginx process id -> lsof logs -> cat
cat $(lsof -p $(ps aux | grep nginx | awk '{print $2}' | xargs | awk '{print $2}') | grep error.log | awk '{print $9}' | xargs | awk '{print $1}')
