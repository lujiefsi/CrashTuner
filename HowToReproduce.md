# To deproduce bugs in docker

####0. Environment
You need to install docker first, see`https://docs.docker.com/compose/install/`

#### 1. clone git && cd CrashTuner
`git clone https://github.com/lujiefsi/CrashTuner.git && cd CrashTuner && chmod +x ./*.sh`
#### 2. pull latest docker from docker hub
`sudo docker pull lczxxx123/disreproduce:v0.8.6 ` or `docker pull lczxxx123/disreproduce:v0.8.6 `
#### 3. reproduce bugs
Each bugs may take a long time(about 10 mins) to reproduce
`sudo ./reproduce.sh` 
or `./reproduce.sh` if you don&apos;t need to exec docker with `sudo`
####4. Result
The result generates in ./result.txt. The result for each bug formated as below

    =====================================BugLink:==========================================
    https://issues.apache.org/jira/browse/YARN-9201
    =====================================Result:===========================================
    #important log lines 
	/home/test/DisReproduce/logs/YARN_9238/hadoop-test-resourcemanager-hadoop11.log:java.lang.NullPointerException
    =======================================================================================