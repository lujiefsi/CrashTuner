./restart.sh >/dev/null 2>&1
astr=$1
bstr=$2
hbv=$3
docker network create -d bridge --subnet=172.16.0.0/16   --gateway=172.16.0.1   --ip-range=172.16.1.0/24 hdnetwork
docker run -itd --name hadoop11 --network hdnetwork --ip 172.16.1.128 --hostname hadoop11  lczxxx123/disreproduce:$3 /bin/bash
docker run -itd --name hadoop12 --network hdnetwork --ip 172.16.1.129 --hostname hadoop12  lczxxx123/disreproduce:$3 /bin/bash
docker run -itd --name hadoop13 --network hdnetwork --ip 172.16.1.130 --hostname hadoop13  lczxxx123/disreproduce:$3 /bin/bash

docker cp DisReproduce.jar hadoop11:/home/test/DisReproduce/target/DisReproduce.jar

docker exec -it --user test hadoop11 bash -c "ssh-keygen -t rsa -N \"\" -f \"/home/test/.ssh/id_rsa\""
docker exec -it --user test hadoop12 bash -c "ssh-keygen -t rsa -N \"\" -f \"/home/test/.ssh/id_rsa\""
docker exec -it --user test hadoop13 bash -c "ssh-keygen -t rsa -N \"\" -f \"/home/test/.ssh/id_rsa\""

docker cp hadoop11:/home/test/.ssh/id_rsa.pub ./id_rsa.pub.hadoop11
docker cp hadoop12:/home/test/.ssh/id_rsa.pub ./id_rsa.pub.hadoop12
docker cp hadoop13:/home/test/.ssh/id_rsa.pub ./id_rsa.pub.hadoop13

docker cp ./id_rsa.pub.hadoop11 hadoop11:/home/test/.ssh/id_rsa.pub.hadoop11
docker cp ./id_rsa.pub.hadoop11 hadoop12:/home/test/.ssh/id_rsa.pub.hadoop11
docker cp ./id_rsa.pub.hadoop11 hadoop13:/home/test/.ssh/id_rsa.pub.hadoop11
docker cp ./id_rsa.pub.hadoop12 hadoop11:/home/test/.ssh/id_rsa.pub.hadoop12
docker cp ./id_rsa.pub.hadoop12 hadoop12:/home/test/.ssh/id_rsa.pub.hadoop12
docker cp ./id_rsa.pub.hadoop12 hadoop13:/home/test/.ssh/id_rsa.pub.hadoop12
docker cp ./id_rsa.pub.hadoop13 hadoop11:/home/test/.ssh/id_rsa.pub.hadoop13
docker cp ./id_rsa.pub.hadoop13 hadoop12:/home/test/.ssh/id_rsa.pub.hadoop13
docker cp ./id_rsa.pub.hadoop13 hadoop13:/home/test/.ssh/id_rsa.pub.hadoop13

docker exec -it hadoop11 bash -c "cat /home/test/.ssh/id_rsa.pub.hadoop11 >> /home/test/.ssh/authorized_keys"
docker exec -it hadoop11 bash -c "cat /home/test/.ssh/id_rsa.pub.hadoop12 >> /home/test/.ssh/authorized_keys"
docker exec -it hadoop11 bash -c "cat /home/test/.ssh/id_rsa.pub.hadoop13 >> /home/test/.ssh/authorized_keys"
docker exec -it hadoop12 bash -c "cat /home/test/.ssh/id_rsa.pub.hadoop11 >> /home/test/.ssh/authorized_keys"
docker exec -it hadoop12 bash -c "cat /home/test/.ssh/id_rsa.pub.hadoop12 >> /home/test/.ssh/authorized_keys"
docker exec -it hadoop12 bash -c "cat /home/test/.ssh/id_rsa.pub.hadoop13 >> /home/test/.ssh/authorized_keys"
docker exec -it hadoop13 bash -c "cat /home/test/.ssh/id_rsa.pub.hadoop11 >> /home/test/.ssh/authorized_keys"
docker exec -it hadoop13 bash -c "cat /home/test/.ssh/id_rsa.pub.hadoop12 >> /home/test/.ssh/authorized_keys"
docker exec -it hadoop13 bash -c "cat /home/test/.ssh/id_rsa.pub.hadoop13 >> /home/test/.ssh/authorized_keys"

docker exec -it hadoop11 bash -c "chown -R test:test /home/test/.ssh"
docker exec -it hadoop12 bash -c "chown -R test:test /home/test/.ssh"
docker exec -it hadoop13 bash -c "chown -R test:test /home/test/.ssh"

docker exec -it --user test hadoop11 bash -c "chmod 700 /home/test/.ssh"
docker exec -it --user test hadoop12 bash -c "chmod 700 /home/test/.ssh"
docker exec -it --user test hadoop13 bash -c "chmod 700 /home/test/.ssh"
docker exec -it --user test hadoop11 bash -c "chmod 600 /home/test/.ssh/authorized_keys"
docker exec -it --user test hadoop12 bash -c "chmod 600 /home/test/.ssh/authorized_keys"
docker exec -it --user test hadoop13 bash -c "chmod 600 /home/test/.ssh/authorized_keys"

docker exec -it --user test hadoop11 bash -c "bash /home/test/known_hosts.sh"
docker exec -it --user test hadoop12 bash -c "bash /home/test/known_hosts.sh"
docker exec -it --user test hadoop13 bash -c "bash /home/test/known_hosts.sh"

docker exec -it --user test hadoop11 bash -c "sed -i '1s/^/0.0.0.0,/' /home/test/.ssh/known_hosts"
docker exec -it --user test hadoop12 bash -c "sed -i '1s/^/0.0.0.0,/' /home/test/.ssh/known_hosts"
docker exec -it --user test hadoop13 bash -c "sed -i '1s/^/0.0.0.0,/' /home/test/.ssh/known_hosts"

docker exec -e export BEHOME=/home/test/CrashTuner -it --user test hadoop11 bash -c "/home/test/CrashTuner/bin/analysisone.sh $1 $2"

docker cp hadoop11:/home/test/CrashTuner/output ./

echo "[Finished]"