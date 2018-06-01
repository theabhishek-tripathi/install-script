apt-get -y update && apt-get -y install docker.io

logDir=/var/log/zookeeper/
dataDir=/mnt/zookeeper
sudo docker login $3 --username="$4" --password="$5"
#GRAPHITE_HOST=${11}

# enabling metrics if graphite host is set
sudo docker pull $3/zk-docker:latest && sudo docker run -d --restart always -e ZK_IPS=$1 -e ZK_ID=$2 -v $logDir:/logs -v $dataDir:/data -p 2181:2181 $3/zk-docker /zookeeper-3.4.8/bin/zkServer.sh start tail -F /dev/null
