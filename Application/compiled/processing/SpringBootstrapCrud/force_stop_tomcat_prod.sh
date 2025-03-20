#top

kill $(ps aux | grep 'tomcat' | awk '{print $2}')
