# To deproduce bugs in docker

Our experiment implemented on only one VM(our VM:[8 kernal, 8GB RAM, 50GB Disk]) with three docker instance as distribute node run on it, so **it will take about 10min to reproduce a bug,** a better VM will accelerate the experiment.
#### 0. Environment
You need to install docker first, see [https://docs.docker.com/install/linux/docker-ce/ubuntu/](https://docs.docker.com/install/linux/docker-ce/ubuntu/ "docker install") or [https://phoenixnap.com/kb/how-to-install-docker-on-ubuntu-18-04](https://phoenixnap.com/kb/how-to-install-docker-on-ubuntu-18-04 "docker install").
**We only test this in ubuntu 18.04.**

#### 1. clone git && cd CrashTuner
`git clone https://github.com/lujiefsi/CrashTuner.git && cd CrashTuner && chmod +x ./*.sh`

**Keep your work area in CrashTuner directory**
#### 2. pull latest docker from docker hub
`sudo docker pull lczxxx123/disreproduce:v0.8.8 ` or `docker pull lczxxx123/disreproduce:v0.8.8`
#### 3. reproduce bugs
Each bugs may take a long time(about 10 mins) to reproduce
`sudo ./reproduce.sh` 
or `./reproduce.sh` if you don&apos;t need to exec docker with `sudo`
#### 4. Reproduce a single bug

	./DisReproduce.sh NullP YARN_9238 v0.8.8
	./DisReproduce.sh InvalidStateTransitionException YARN_9248 v0.8.8
	./DisReproduce.sh NullP HDFS_14372 v0.8.8
	./DisReproduce.sh NullP YARN_9165 v0.8.8
	./DisReproduce.sh InvalidStateTransitionException YARN_9201 v0.8.8
	./DisReproduce.sh NullP YARN_8649 v0.8.8
	./DisReproduce.sh InvalidStateTransitionException YARN_9194 v0.8.8
	./DisReproduce.sh LeaseException HBASE_22017 v0.8.8
	./DisReproduce.sh hbase-test-master-hadoop11.log HBASE_22041 v0.8.8
	./DisReproduce.sh NullP HBASE_22050 v0.8.8
	./DisReproduce.sh NullP HBASE_21740 v0.8.8
	./DisReproduce.sh NullP HBASE_22023 v0.8.8
	./DisReproduce.sh NullP HDFS_14216 v0.8.8
	./DisReproduce.sh NullP YARN_9164 v0.8.8
	./DisReproduce.sh NullP YARN_9193 v0.8.8	
Maybe need sudo before each command.
If you need to reprodue another bug after reproduce one bug, you need to `(sudo) ./restart`.
	
#### 5. Result
The result generates in ./result.txt. The result for each bug formated as below

    =====================================BugLink:==========================================
    https://issues.apache.org/jira/browse/${BUGID}
    =====================================Result:===========================================
    #important log lines 
	#the file path here presented the path in docker, correspond logs exist in CrashTuner/logs/${BUGID}
	/home/test/DisReproduce/logs/${BUGID}/hadoop-test-resourcemanager-hadoop11.log:java.lang.NullPointerException
    =======================================================================================
	
and you can see all the logs during reproduce in CrashTuner/logs/${BUGID}

For HBASE_22041, it will hang staup process forever and print thounds of logs. But in order to speed up the reproduce, we only make this bug run a few minutes and print last five log statements.Its error log can be like:
```
2019-08-10 08:58:13,485 WARN  [RSProcedureDispatcher-pool4-t29] procedure.RSProcedureDispatcher: request to server hadoop12.hdnetwork,16020,1565427268910 failed due to org.apache.hadoop.hbase.ipc.FailedServerException: Call to hadoop12.hdnetwork/172.16.1.129:16020 failed on local exception: org.apache.hadoop.hbase.ipc.FailedServerException: This server is in the failed servers list: hadoop12.hdnetwork/172.16.1.129:16020, try=1308, retrying...
2019-08-10 08:58:13,586 WARN  [RSProcedureDispatcher-pool4-t30] procedure.RSProcedureDispatcher: request to server hadoop12.hdnetwork,16020,1565427268910 failed due to org.apache.hadoop.hbase.ipc.FailedServerException: Call to hadoop12.hdnetwork/172.16.1.129:16020 failed on local exception: org.apache.hadoop.hbase.ipc.FailedServerException: This server is in the failed servers list: hadoop12.hdnetwork/172.16.1.129:16020, try=1309, retrying...
2019-08-10 08:58:13,687 WARN  [RSProcedureDispatcher-pool4-t31] procedure.RSProcedureDispatcher: request to server hadoop12.hdnetwork,16020,1565427268910 failed due to org.apache.hadoop.hbase.ipc.FailedServerException: Call to hadoop12.hdnetwork/172.16.1.129:16020 failed on local exception: org.apache.hadoop.hbase.ipc.FailedServerException: This server is in the failed servers list: hadoop12.hdnetwork/172.16.1.129:16020, try=1310, retrying...>
```

### 6. Failed to Reproduce
We have reproduced all bugs successfully in our VM. If you can't reproduce one bug, you can try again by running it alone. But if the bug still fails to reproduce, please create an issue and attatch the runtime logs. 