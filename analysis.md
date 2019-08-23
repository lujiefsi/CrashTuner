# To analysis bugs in docker
**The CrashTuner directory is your working directory.**

## Pull the docker

We have updated the docker, so you need re-clone the docker by

`sudo docker pull lczxxx123/disreproduce:v0.8.23`

## Download the analysis script

We also upload the analysis script, you need

`git fetch`

`git checkout origin/master -- ./Analysisone.sh && chmod +x ./Analysisone.sh`

`git checkout origin/master -- ./Analysisall.sh && chmod +x ./Analysisall.sh`


## Perform Analysis

Run the command to analysis all target systems

`sudo ./Analysisall.sh false v0.8.23`

or run the command to analysis a single target system

`sudo ./Analysisone.sh yarn false v0.8.23`

`sudo ./Analysisone.sh hdfs false v0.8.23`

`sudo ./Analysisone.sh hbase false v0.8.23`

`sudo ./Analysisone.sh zk false v0.8.23`


## Result

the analysis result exists in ./output.

Results are stored in the files  whose name start wtih taeget system name and suffix name is ".txt".

Take the yarn for example


yarn_meta-info.txt stores the meta-info.

yarn_fieldRead.txt stores the pre-read static crash points.

yarn_fieldWrite.txt stroes the post-write static crash points.

yarn_executed_SP.txt stros the dynamic crash points.


### Minor change 

The result may have minor change compared to our paper, because we have improved our code. For example, our paper say CrashTuner can't
find the meta-info in ZK, now CrashTuner can found three meta-infos for ZK.




## Perform trigger

Previous  commnd only perform analysis, in order to run the trgigger, you need change the “false” to “true“， like

`sudo ./Analysisall.sh true v0.8.23`

or

`sudo ./Analysisone.sh yarn true v0.8.23`

`sudo ./Analysisone.sh hdfs true v0.8.23`

`sudo ./Analysisone.sh hbase true v0.8.23`

`sudo ./Analysisone.sh zk true v0.8.23`


But it can be very  time-consuming， we strongly recommend you reproduce each with this 
[document](https://github.com/lujiefsi/CrashTuner/tree/master/HowToReproduce.md), along the analysis for each bug in 
[detail](https://github.com/lujiefsi/CrashTuner/tree/master/detail). This can save a lot of time.

## Tips

You don't need update the docker if you only want reproduce the bug. And even you update the docker, the  instructions in
the [document](https://github.com/lujiefsi/CrashTuner/tree/master/HowToReproduce.md) still works.

