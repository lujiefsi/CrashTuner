# To reproduce bugs in docker

In our artifacts, to simplify the setup process, we conduct the experiments on one VM (our VM:[1 or 4 kernal, 8GB RAM, 100GB Disk]) with three docker instance as distribute node run on it. So **it will take about 10min to reproduce a bug**.  The performance can be significantly improved in a real distributed environment.  
#### 0. Environment
**We only tested on an ubuntu 18.04 VM with `sudo` privilege.**
You need to install docker first, see [https://docs.docker.com/install/linux/docker-ce/ubuntu/](https://docs.docker.com/install/linux/docker-ce/ubuntu/ "docker install") or [https://phoenixnap.com/kb/how-to-install-docker-on-ubuntu-18-04](https://phoenixnap.com/kb/how-to-install-docker-on-ubuntu-18-04 "docker install").


#### 1. Clone CrashTuner
`git clone https://github.com/lujiefsi/CrashTuner.git && cd CrashTuner && chmod +x ./*.sh`

**The CrashTuner directory is your working directory.**
#### 2. Pull latest docker from docker hub
`sudo docker pull lczxxx123/disreproduce:v0.8.11 `
#### 3. Reproduce all bugs 
`sudo ./reproduce.sh`

Each bugs may take a long time(about 10 minutes) to reproduce.

Some bugs will make the job hang for long time, don't worry and **do not kill the reproduce process** and just wait.
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

**After reproducing a bug, you need to run the command `sudo ./restart`, to clean up the environment before trying a new bug.**

We have reported 20 bugs in our paper. Three bug issues(HDFS-14216, YARN-8650 and YARN-9164) report two bugs. The two bugs in each issue share the same root cause and can be analysed together.

#### 5. Result
If you reproduce all bugs one time (run the command `sudo ./reproduce.sh`), the result is logged in ./result.txt.
If you reproduce one bug one time, the result is printed directly to the console.
The result for each bug is formated as below:

    =====================================BugLink:==========================================
    https://issues.apache.org/jira/browse/${BUGID}
    =====================================Result:===========================================
    log-file:linenumber: error messages
    =======================================================================================
	

BugLink points to the URL of a bug issue where we reported each bug, and it also prints the `error messages` when the bug is triggered. The `log-file:linenumber` gives the detailed location of the error messages. You can check the log file in detail (like stack trace.).

For example, in reproducing YARN-9164, you may see the below error messages:
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
There are multiple errors. In such case, we need to read each error message in detail to check which message is the root cause. In this bug, the exception at line 373 in file ./logs/YARN_9164/hadoop-test-resourcemanager-hadoop11.log is the root cause, and it is same as in the reported bug issue https://issues.apache.org/jira/browse/YARN-9164:
```
2019-08-10 09:58:44,156 FATAL org.apache.hadoop.yarn.event.EventDispatcher: Error in handling event type APP_ATTEMPT_REMOVED to the Event Dispatcher
java.lang.NullPointerException
        at 
```


In reproducing HBASE_22041, the staup process hangs and prints thounds of logs. In order to speed up the reproducing process, we only run 6 minutes and give the last five log statements. Its error messages will be like:
```
2019-08-10 08:58:13,485 WARN  [RSProcedureDispatcher-pool4-t29] procedure.RSProcedureDispatcher: request to server hadoop12.hdnetwork,16020,1565427268910 failed due to org.apache.hadoop.hbase.ipc.FailedServerException: Call to hadoop12.hdnetwork/172.16.1.129:16020 failed on local exception: org.apache.hadoop.hbase.ipc.FailedServerException: This server is in the failed servers list: hadoop12.hdnetwork/172.16.1.129:16020, try=1308, retrying...
2019-08-10 08:58:13,586 WARN  [RSProcedureDispatcher-pool4-t30] procedure.RSProcedureDispatcher: request to server hadoop12.hdnetwork,16020,1565427268910 failed due to org.apache.hadoop.hbase.ipc.FailedServerException: Call to hadoop12.hdnetwork/172.16.1.129:16020 failed on local exception: org.apache.hadoop.hbase.ipc.FailedServerException: This server is in the failed servers list: hadoop12.hdnetwork/172.16.1.129:16020, try=1309, retrying...
2019-08-10 08:58:13,687 WARN  [RSProcedureDispatcher-pool4-t31] procedure.RSProcedureDispatcher: request to server hadoop12.hdnetwork,16020,1565427268910 failed due to org.apache.hadoop.hbase.ipc.FailedServerException: Call to hadoop12.hdnetwork/172.16.1.129:16020 failed on local exception: org.apache.hadoop.hbase.ipc.FailedServerException: This server is in the failed servers list: hadoop12.hdnetwork/172.16.1.129:16020, try=1310, retrying...>
```

### 6. Failed to Reproduce
We have reproduced all bugs successfully in our VM. If you can't reproduce one bug, you can try again by restarting it from scratch. If the bug still fails to reproduce, please create an issue and attatch the runtime logs. 
