# To analysis bugs in docker
**The CrashTuner directory is your working directory.**

## update the docker

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


the analysis result exists in ./output

## Perform trigger

Previous  commnd only perform analysis, in order to run the trgigger, you need change the “false” to “true“， like

`sudo ./Analysisall.sh true v0.8.23`

or

`sudo ./Analysisone.sh yarn true v0.8.23`

`sudo ./Analysisone.sh hdfs true v0.8.23`

`sudo ./Analysisone.sh hbase true v0.8.23`

`sudo ./Analysisone.sh zk true v0.8.23`
