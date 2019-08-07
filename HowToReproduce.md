# To deproduce bugs in docker

#### 0. Environment
You need to install docker first, see [https://docs.docker.com/compose/install/](https://docs.docker.com/compose/install/ "docker install").

#### 1. clone git && cd CrashTuner
`git clone https://github.com/lujiefsi/CrashTuner.git && cd CrashTuner && chmod +x ./*.sh`
#### 2. pull latest docker from docker hub
`sudo docker pull lczxxx123/disreproduce:v0.8.6 ` or `docker pull lczxxx123/disreproduce:v0.8.6 `
#### 3. reproduce bugs
Each bugs may take a long time(about 10 mins) to reproduce
`sudo ./reproduce.sh` 
or `./reproduce.sh` if you don&apos;t need to exec docker with `sudo`
#### 4. Result
The result generates in ./result.txt. The result for each bug formated as below

    =====================================BugLink:==========================================
    https://issues.apache.org/jira/browse/${BUGID}
    =====================================Result:===========================================
    #important log lines 
	#the file path here presented the path in docker, correspond logs exist in CrashTuner/logs/${BUGID}
	/home/test/DisReproduce/logs/${BUGID}/hadoop-test-resourcemanager-hadoop11.log:java.lang.NullPointerException
    =======================================================================================
	
and you can see all the logs during reproduce in CrashTuner/logs/${BUGID}
#### 5. Reproduce single bug

	./DisReproduce.sh NullP YARN_9238 v0.8.6
	./DisReproduce.sh InvalidStateTransitionException YARN_9248 v0.8.6
	./DisReproduce.sh NullP HDFS_14372 v0.8.6
	./DisReproduce.sh NullP YARN_9165 v0.8.6
	./DisReproduce.sh InvalidStateTransitionException YARN_9201 v0.8.6
	./DisReproduce.sh NullP YARN_8649 v0.8.6
	./DisReproduce.sh InvalidStateTransitionException YARN_9194 v0.8.6
	./DisReproduce.sh LeaseException HBASE_22017 v0.8.6
	./DisReproduce.sh hbase-test-master-hadoop11.log HBASE_22041 v0.8.6
	./DisReproduce.sh NullP HBASE_22050 v0.8.6
	./DisReproduce.sh NullP HBASE_21740 v0.8.6
	./DisReproduce.sh NullP HBASE_22023 v0.8.6
	./DisReproduce.sh NullP HDFS_14216 v0.8.6
	./DisReproduce.sh NullP YARN_9164 v0.8.6
	./DisReproduce.sh NullP YARN_9193 v0.8.6	
Maybe need sudo before each command.
	
