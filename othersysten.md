# Analsis other system(remain to be improved)
Currently you can apply CrashTuner on other system like Cassandra, Storm, Flink.
Taking the Cassandra for example:
## Updating the configuration file : butterflyeffect.properties
```
system = CASSANDRA
version = 3.11.4

jardir=/home/hires/CrashTuner/jars/cassandra/cassandra-3.11.4
scopefile=/home/hires/CrashTuner/conf/scope_ca_3.2.0
exclusionfile=/home/hires/CrashTuner/conf/Java60RegressionExclusions.txt
commnicationfile= /home/hires/CrashTuner/conf/commnicationfile/hadoop-3.2.0
profilelogs=/home/hires/CrashTuner/logs/profilelogs
outputdir=/home/hires/CrashTuner/output

homepath=/home/hires/CrashTuner
system_home = /home/hires/cloudraid/cassandra/cassandra-3.11.4
java_home=/home/hires/program/jdk1.8.0_65
master = hadoop11
slaves_hostname = hadoop14,hadoop15
slaves_netaddress= 10.3.1.11,10.3.1.15,10.3.1.14
workload = stress
```
## 
You need change the start script of Cassandra to change the classloader and classppath:

```
CLASSPATH=/tmp/trigger.jar:$CLASSPATH
JVM_OPTS="$JVM_OPTS -Djava.system.class.loader=com.ict.instrumention.InstrumentClassLoader"
```

## Deploy the Cassandra.
system_home gives where the cassandra should exist.
