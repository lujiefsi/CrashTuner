We provide some very very useful shell scripts to simplify the deployment of distrbiteud system.

# Real distributed mode in on machine

Most users only have one machine, formerly, we only can  deploy the *pseudo distributed system* in
[sigle node](https://hadoop.apache.org/docs/current/hadoop-project-dist/hadoop-common/SingleCluster.html).

One way to build  the *real* distributed system is to fork two or more VMs, which can can easily slow down the host machine, and it is hard for us to start or stop the VMs automatically. 
Instead we provide the [script](https://github.com/lujiefsi/CrashTuner/blob/master/Analysisone.sh) and docker image to 
build three docker instances in one machine(or VM) automatically. In the shell, we first build virtual  LAN, 
```
docker network create -d bridge --subnet=172.16.0.0/16   --gateway=172.16.0.1   --ip-range=172.16.1.0/24 hdnetwork
```
then start three docker instakce with different hostname and IP address.
```
docker run -itd --name hadoop11 --network hdnetwork --ip 172.16.1.128 --hostname hadoop11  lczxxx123/disreproduce:$3 /bin/bash
docker run -itd --name hadoop12 --network hdnetwork --ip 172.16.1.129 --hostname hadoop12  lczxxx123/disreproduce:$3 /bin/bash
docker run -itd --name hadoop13 --network hdnetwork --ip 172.16.1.130 --hostname hadoop13  lczxxx123/disreproduce:$3 /bin/bash
```

then the script configure the passphraseless,
```
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
```
After these step, you can deploy the distributed system on three docker instance.

# Start or Sop the distributed system
Many distributed systems(like zookeeper and cassandra) don't provide the scripts to start all slaves. Hence you can only login every node
and start the slaves one by one. If you want to stop the distributed system, you also need to login every node
and stop the slave one by one. We have provided the script to do this, you can check 
[CrashTuner_script.tgz](https://github.com/lujiefsi/CrashTuner/blob/master/CrashTuner_script.tgz) for detail.

# Workloads
We also provide the scripts to perform workload, also check them in 
[CrashTuner_script.tgz](https://github.com/lujiefsi/CrashTuner/blob/master/CrashTuner_script.tgz)

# If you can't find the script that we list here, or have a problem to start docker, plese leave an issue.

