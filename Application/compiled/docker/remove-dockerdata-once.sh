docker ps
docker ps -a
docker volume ls
docker images -a

docker rmi --force $(docker images -a -q)
docker rm --force $(docker ps -a -q)
docker volume prune --force

