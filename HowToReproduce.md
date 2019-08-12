# To reproduce bugs in docker

Our experiment implemented on only one VM(our VM:[1 or 4 kernal, 8GB RAM, 50GB Disk]) with three docker instance as distribute node run on it, so **it will take about 10min to reproduce a bug,** a better VM will accelerate the experiment.
#### 0. Environment
lk**We only tested on an ubuntu 18.04 VM with `sudo` privilege.**
You need to install docker first, see [https://docs.docker.com/install/linux/docker-ce/ubuntu/](https://docs.docker.com/install/linux/docker-ce/ubuntu/ "docker install") or [https://phoenixnap.com/kb/how-to-install-docker-on-ubuntu-18-04](https://phoenixnap.com/kb/how-to-install-docker-on-ubuntu-18-04 "docker install").


#### 1. clone git && cd CrashTuner
`git clone https://github.com/lujiefsi/CrashTuner.git && cd CrashTuner && chmod +x ./*.sh`

**Keep your work area in CrashTuner directory.**
#### 2. pull latest docker from docker hub
`sudo docker pull lczxxx123/disreproduce:v0.8.11 `
#### 3. Reproduce all bugs one time
Each bugs may take a long time(about 10 mins) to reproduce
`sudo ./reproduce.sh`
#### 4. Reproduce a single bug

	sudo ./DisReproduce.sh NullP YARN_9238 v0.8.11
	sudo ./DisReproduce.sh InvalidStateTransitionException YARN_9248 v0.8.11
	sudo ./DisReproduce.sh NullP HDFS_14372 v0.8.11
	sudo ./DisReproduce.sh NullP YARN_9165 v0.8.11
	sudo ./DisReproduce.sh InvalidStateTransitionException YARN_9201 v0.8.11
	sudo ./DisReproduce.sh NullP YARN_8649 v0.8.11
	sudo ./DisReproduce.sh InvalidStateTransitionException YARN_9194 v0.8.11
	sudo ./DisReproduce.sh LeaseException HBASE_22017 v0.8.11
	sudo ./DisReproduce.sh hbase-test-master-hadoop11.log HBASE_22041 v0.8.11
	sudo ./DisReproduce.sh NullP HBASE_22050 v0.8.11
	sudo ./DisReproduce.sh NullP HBASE_21740 v0.8.11
	sudo ./DisReproduce.sh NullP HBASE_22023 v0.8.11
	sudo ./DisReproduce.sh NullP HDFS_14216 v0.8.11
	sudo ./DisReproduce.sh NullP YARN_9164 v0.8.11
	sudo ./DisReproduce.sh NullP YARN_9193 v0.8.11
	sudo ./DisReproduce.sh NullP MR_7178 v0.8.11
	sudo ./DisReproduce.sh InvalidStateTransitionException YARN_8650 v0.8.11

**If you need to reprodue another bug after reproduce one bug, you need to `sudo ./restart`.**

We have reported 20 bugs in our paper, 3 of them  share root cause and same patchs with above bugs, so we don't reproduce them alone.
	
#### 5. Result
if you reproduce all bugs one time, the result generates in ./result.txt.
If you reproduce one bug one time, the result is printed directly in console.
The result for each bug formated as below

    =====================================BugLink:==========================================
    https://issues.apache.org/jira/browse/${BUGID}
    =====================================Result:===========================================
    log-file:linenumber: expected-exception
    =======================================================================================
	

BugLink is the issue  site that we report each bug, it contains the excetpion that will be thrown when the bug is triggered.

Result will give  which log file and which line that the expected exception exists. You can check the log file for detail(like stack trace.).

For YARN-9164, you may see that multiple  result like:
```
=====================================BugLink:==========================================
This bug trigger success randomly, due to randomness of allocation of slave container
https://issues.apache.org/jira/browse/YARN-9164
=====================================Result:==========================================
./logs/YARN_9164/userlogs/application_1565430468786_0001/container_1565430468786_0001_01_000001/syslog:108:java.lang.NullPointerException: java.lang.NullPointerException
./logs/YARN_9164/userlogs/application_1565430468786_0001/container_1565430468786_0001_01_000001/syslog:150:Caused by: org.apache.hadoop.ipc.RemoteException(java.lang.NullPointerException): java.lang.NullPointerException
./logs/YARN_9164/hadoop-test-resourcemanager-hadoop11.log:275:java.lang.NullPointerException
./logs/YARN_9164/hadoop-test-resourcemanager-hadoop11.log:373:java.lang.NullPointerException
======================================================================================
```
in such case, you should read each log file for detail, and see which exception is expected. In this bug, the exception at line 373 in file ./logs/YARN_9164/hadoop-test-resourcemanager-hadoop11.log is expected,  because it is same as we report in BugLink:
```
2019-08-10 09:58:44,156 FATAL org.apache.hadoop.yarn.event.EventDispatcher: Error in handling event type APP_ATTEMPT_REMOVED to the Event Dispatcher
java.lang.NullPointerException
        at org.apache.hadoop.yarn.server.resourcemanager.scheduler.AbstractYarnScheduler.completedContainer(AbstractYarnScheduler.java:696)
        at org.apache.hadoop.yarn.server.resourcemanager.scheduler.capacity.CapacityScheduler.doneApplicationAttempt(CapacityScheduler.java:1123)
        at org.apache.hadoop.yarn.server.resourcemanager.scheduler.capacity.CapacityScheduler.handle(CapacityScheduler.java:1827)
        at org.apache.hadoop.yarn.server.resourcemanager.scheduler.capacity.CapacityScheduler.handle(CapacityScheduler.java:171)
        at org.apache.hadoop.yarn.event.EventDispatcher$EventProcessor.run(EventDispatcher.java:66)
        at java.lang.Thread.run(Thread.java:745)
```


For HBASE_22041, it will hang staup process forever and print thounds of logs. But in order to speed up the reproduce, we only make this bug run a few minutes and print last five log statements.Its error log can be like:
```
2019-08-10 08:58:13,485 WARN  [RSProcedureDispatcher-pool4-t29] procedure.RSProcedureDispatcher: request to server hadoop12.hdnetwork,16020,1565427268910 failed due to org.apache.hadoop.hbase.ipc.FailedServerException: Call to hadoop12.hdnetwork/172.16.1.129:16020 failed on local exception: org.apache.hadoop.hbase.ipc.FailedServerException: This server is in the failed servers list: hadoop12.hdnetwork/172.16.1.129:16020, try=1308, retrying...
2019-08-10 08:58:13,586 WARN  [RSProcedureDispatcher-pool4-t30] procedure.RSProcedureDispatcher: request to server hadoop12.hdnetwork,16020,1565427268910 failed due to org.apache.hadoop.hbase.ipc.FailedServerException: Call to hadoop12.hdnetwork/172.16.1.129:16020 failed on local exception: org.apache.hadoop.hbase.ipc.FailedServerException: This server is in the failed servers list: hadoop12.hdnetwork/172.16.1.129:16020, try=1309, retrying...
2019-08-10 08:58:13,687 WARN  [RSProcedureDispatcher-pool4-t31] procedure.RSProcedureDispatcher: request to server hadoop12.hdnetwork,16020,1565427268910 failed due to org.apache.hadoop.hbase.ipc.FailedServerException: Call to hadoop12.hdnetwork/172.16.1.129:16020 failed on local exception: org.apache.hadoop.hbase.ipc.FailedServerException: This server is in the failed servers list: hadoop12.hdnetwork/172.16.1.129:16020, try=1310, retrying...>
```

### 6. Failed to Reproduce
We have reproduced all bugs successfully in our VM. If you can't reproduce one bug, you can try again by running it alone. But if the bug still fails to reproduce, please create an issue and attatch the runtime logs. 