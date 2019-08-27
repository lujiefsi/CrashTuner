# Analsis other system(remain to be improved)
Currently you can apply CrashTuner on other system like Cassandra, Storm, Flink.

Taking the Cassandra for example, we will give how we test a system step by step:


## update the repo

git fetch

git checkout origin/master -- ./cassandra-3.11.4.tar.gz

git checkout origin/master -- ./apache-cassandra-3.11.4.jar

git checkout origin/master -- ./startDockerForCA.sh

chmod +x ./*.sh

## Deploy the distributed system

first you need start the docker instances:

>sudo ./startDockerForCA.sh v0.8.23

may take a long time, just wait.

then login hadoop11

>sudo docker exec -it --user test hadoop11 /bin/bash

change to root(su - root), password is 123456

>yum install lsof

>su - test

>cd /home/test/DisReproduce/cassandra

>tar -zxvf cassandra-3.11.4.tar.gz

>cd ./cassandra-3.11.4

>vim conf/cassandra.yaml

>change the 'listen_address' to 172.16.1.128

>change the 'seeds' to 172.16.1.128,172.16.1.129,172.16.1.130


then login hadoop12

>ssh hadoop12

change to root(su - root), password is 123456

>yum install lsof

>su - test

>cd /home/test/DisReproduce/cassandra

>tar -zxvf cassandra-3.11.4.tar.gz

>cd ./cassandra-3.11.4

>vim ./conf/logback.xml

>change all "hadoop11" to hadoop12( %s/hadoop11/hadoop12/g )

>vim conf/cassandra.yaml

>change the 'listen_address' to 172.16.1.129

>change the 'seeds' to 172.16.1.128,172.16.1.129,172.16.1.130


then login hadoop13

>ssh hadoop13

change to root(su - root), password is 123456

>yum install lsof

>su - test

>cd /home/test/DisReproduce/cassandra

>tar -zxvf cassandra-3.11.4.tar.gz

>vim ./conf/logback.xml

>change all "hadoop11" to hadoop13( %s/hadoop11/hadoop13/g )

>vim conf/cassandra.yaml

>change the 'listen_address' to 172.16.1.130

>change the 'seeds' to 172.16.1.128,172.16.1.129,172.16.1.130

then back to hadoop11
>exit

>exit

>cd ~/CrashTuner/

## start to analysis
First you need repalce the content of conf/butterflyeffect.properties by below code:
```
system = CASSANDRA
version = 3.11.4

jardir=/home/test/CrashTuner/jars/cassandra/cassandra-3.11.4
scopefile=/home/test/CrashTuner/conf/scope_ca_3.11.4
exclusionfile=/home/test/CrashTuner/conf/Java60RegressionExclusions.txt
commnicationfile= /home/test/CrashTuner/conf/commnicationfile/hadoop-3.2.0
profilelogs=/home/test/CrashTuner/logs/profilelogs
outputdir=/home/test/CrashTuner/output

homepath=/home/test/CrashTuner
system_home = /home/test/DisReproduce/cassandra/cassandra-3.11.4
java_home=/home/test/program/jdk1.8.0_65

master = hadoop11
slaves_hostname = hadoop12,hadoop13
slaves_netaddress= 172.16.1.128,172.16.1.129,172.16.1.130
workload = stress
testall=false
```
then start the rpc server

>./bin/startService.sh &

then start to profile

>/home/test/program/jdk1.8.0_65/bin/java -cp ./target/CrashTuner.jar com.ict.main.Driver -confdir ./conf -target 0 -testall false

then start to static analysis

>vim scope_ca_3.2.0

>add code:

```
Primordial,Java,stdlib,none
Primordial,Java,jarFile,primordial.jar.model
Application,Java,jarFile,/home/test/CrashTuner/jars/cassandra/apache-cassandra-3.11.4.jar
```

>./bin/startFS.sh

will take long time to build call graph, just wait and do not kill the process.

restart the rpcServer

>./bin/stopService.sh && ./bin/startService.sh &


start to  profile and trigger

>/home/test/program/jdk1.8.0_65/bin/java -cp ./target/CrashTuner.jar com.ict.main.Driver -confdir ./conf -target 1 -testall true

see the result in ./output

##  Changing the classloader and classppath

You need change the start script of each system to change the classloader and classppath:
```
CLASSPATH=/tmp/trigger.jar:$CLASSPATH
JVM_OPTS="$JVM_OPTS -Djava.system.class.loader=com.ict.instrumention.InstrumentClassLoader"
```
*we have change this for cassandra, just skip it for cassandra*
## You may meet the some problem while applying CrashTuner on other system, just leave a issue along with your configution.
