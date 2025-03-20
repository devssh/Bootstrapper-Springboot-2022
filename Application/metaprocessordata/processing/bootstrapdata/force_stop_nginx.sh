kill $(ps aux | grep 'nginx' | awk '{print $2}')
