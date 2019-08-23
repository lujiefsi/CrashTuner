# To analyse crash points in docker
**The CrashTuner directory is your working directory.**

## Pull the docker

We have updated the docker, so you need re-clone the docker by

`sudo docker pull lczxxx123/disreproduce:v0.8.23`

## Download the analysis script

We also upload the analysis script, you need

`git fetch`

`git checkout origin/master -- ./Analysisone.sh`

`git checkout origin/master -- ./Analysisall.sh`


## Perform Analysis

Run the command to analysis all target systems

`sudo ./Analysisall.sh false v0.8.23`

or run the command to analysis a single target system

`sudo ./Analysisone.sh yarn false v0.8.23`

`sudo ./Analysisone.sh hdfs false v0.8.23`

`sudo ./Analysisone.sh hbase false v0.8.23`

`sudo ./Analysisone.sh zk false v0.8.23`


## Result

The analysis result exists in ./output.

Results are stored in the files  whose name start wtih target system name and suffix name is ".txt".

Taking the yarn for example


1. "./output/yarn_meta-info.txt" stores the meta-info.

2. "./output/yarn_fieldRead.txt" stores the pre-read static crash points.

3. "./output/yarn_fieldWrite.txt" stores the post-write static crash points.

4. "./output/yarn_executed_SP.txt" stores the dynamic crash points.


One meta-info or crash point per line.


### Minor change 

The result may have minor change compared to our paper, because we have improved our code. For example, our paper say CrashTuner can't
find the meta-info type in ZK, now CrashTuner can find three meta-info types for ZK.




## Perform trigger
**Don't be cheated by the term "Analysis"**, actually, this docker include the whole framework of CrashTuner. 

You can change the "false" to "true" to ， like

`sudo ./Analysisall.sh true v0.8.23`

or

`sudo ./Analysisone.sh yarn true v0.8.23`

`sudo ./Analysisone.sh hdfs true v0.8.23`

`sudo ./Analysisone.sh hbase true v0.8.23`

`sudo ./Analysisone.sh zk true v0.8.23`


"false" means that we only enable analysis and disable the trigger phase.

But it can be very  time-consuming to perform a trigger, once you enable it, just wait for test completes. **We strongly recommend you reproduce each bug with this 
[document](https://github.com/lujiefsi/CrashTuner/tree/master/HowToReproduce.md)(including the same trigger as CrashTuner) along the analysis for each bug in 
[detail](https://github.com/lujiefsi/CrashTuner/tree/master/detail)**. This can save a lot of time to understand a new bug.

## How it works

There are three phases in analysis: train, static analysis(including log analysis), profile. If you want to know where are they,

you can use commond `sudo docker exec -it --user test hadoop11 /bin/bash` to login hadoop11, 
then `cd /home/test/CrashTuner/bin && ls`, you can see  analysisone.sh. In the script:


1. "startService.sh" is used to start our rpc server.
2. "com.ict.main.Driver -target 0"  perfroms train and generates the logs(used for log analysis) that exists in "./log/training".
3. "startFS.sh" perform the static analysis.
4. ""com.ict.main.Driver -target 1"  perfroms profile.

you can spilt the script and run the analysis step by step.

All logs exists "./CrashTuner/logs", you can check them while the test is running.


## Tips

You don't need update the docker if you only want to reproduce the  new bugs. And even you update the docker, the instructions in
the reproducing [document](https://github.com/lujiefsi/CrashTuner/tree/master/HowToReproduce.md) still works.
