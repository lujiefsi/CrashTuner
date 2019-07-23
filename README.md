# CrashTuner

## What can you get from this project?
This the report of bugs that found by CrashTuner. We will give the detail of how to trigger each bug. Besides, we also give a simple version of CrashTuner in docker to show how CrashTuner find these bugs.
## New bugs

In the below table, we give all new bugs found by CrashTuner. You can click the Bug Id to see the bug report and Patch to see the fixing, and Detail to see how to trigger the bug. In the detail, we only show a small code snippet, you can download the whole buggy project code(which can be found in bug report) for further understanding.

|Bug Id  |Priority |Status |Patch|Detail|Meta-info|
| :------:  | :------: | :------: | :------: | :------: | :------: |
| [YARN-9164](https://issues.apache.org/jira/browse/YARN-9164) | Critical | Fixed | [YARN-9164-2.patch](https://issues.apache.org/jira/secure/attachment/12953556/YARN-9164-2.patch) | [YARN-9164](https://github.com/lujiefsi/CrashTuner/blob/master/detail/YARN-9164.md) | NodeId |
| [YARN-9165](https://issues.apache.org/jira/browse/YARN-9165) | Critical | Fixed | [YARN-9164-2.patch](https://issues.apache.org/jira/secure/attachment/12953556/YARN-9164-2.patch) | [YARN-9165](https://github.com/lujiefsi/CrashTuner/blob/master/detail/YARN-9165.md) | ContainerId |
| [YARN-9193](https://issues.apache.org/jira/browse/YARN-9193) | Critical | Fixed | [YARN-9194_6.patch](https://issues.apache.org/jira/secure/attachment/12955092/YARN-9194_6.patch) | [YARN-9193](https://github.com/lujiefsi/CrashTuner/blob/master/detail/YARN-9193.md)| ContainerId |
| [YARN-9238](https://issues.apache.org/jira/browse/YARN-9238) | Critical | Fixed | [YARN-9238_3.patch](https://issues.apache.org/jira/secure/attachment/12959002/YARN-9238_3.patch) | [YARN-9238](https://github.com/lujiefsi/CrashTuner/blob/master/detail/YARN-9238.md) | ApplicationId |
| [YARN-9201](https://issues.apache.org/jira/browse/YARN-9201) | Critical | Fixed | [YARN-9194_6.patch](https://issues.apache.org/jira/secure/attachment/12955092/YARN-9194_6.patch)  | [YARN-9201](https://github.com/lujiefsi/CrashTuner/blob/master/detail/YARN-9201.md) | ContainerId |
| [YARN-8649](https://issues.apache.org/jira/browse/YARN-8649) | Critical | Fixed | [YARN-8649_5.patch](https://issues.apache.org/jira/secure/attachment/12936754/YARN-8649_5.patch) | [YARN-8649](https://github.com/lujiefsi/CrashTuner/blob/master/detail/YARN-8649.md) | AppAttemptId |
| [HBASE-22017](https://issues.apache.org/jira/browse/HBASE-22017) | Critical | Fixed | [pull-158](https://github.com/apache/hbase/pull/158) | [HBASE-22017](https://github.com/lujiefsi/CrashTuner/blob/master/detail/HBASE-22017.md) | ServerName |
| [HBASE-22041](https://issues.apache.org/jira/browse/HBASE-22041)  | Critical | Unresolved | - | [HBASE-22041](https://github.com/lujiefsi/CrashTuner/blob/master/detail/HBASE-22041.md) | ServerName |
| [HDFS-14216](https://issues.apache.org/jira/browse/HDFS-14216) | Major | Fixed |[HDFS-14216_6.patch](https://issues.apache.org/jira/secure/attachment/12959591/HDFS-14216_6.patch) | [HDFS-14216](https://github.com/lujiefsi/CrashTuner/blob/master/detail/HDFS-14216.md) | DataNodeInfo |
| [HDFS-14372](https://issues.apache.org/jira/browse/HDFS-14372) | Major | Fixed | [HDFS-14372_2.patch](https://issues.apache.org/jira/secure/attachment/12964354/HDFS-14372_2.patch) | [HDFS-14372](https://github.com/lujiefsi/CrashTuner/blob/master/detail/HDFS-14372.md) | BPOfferService |
| [HBASE-22050](https://issues.apache.org/jira/browse/HBASE-22050) | Major | Unresolved |[HBASE-22050.patch](https://issues.apache.org/jira/secure/attachment/12962339/0001-fix-HBASE-22050.patch) | [HBASE-22050](https://github.com/lujiefsi/CrashTuner/blob/master/detail/HBASE-22050.md) | RegionInfo |
| [YARN-9248](https://issues.apache.org/jira/browse/YARN-9248) | Major | Fixed | [YARN-9248_5.patch](https://issues.apache.org/jira/secure/attachment/12956913/YARN-9248_5.patch) | [YARN-9248](https://github.com/lujiefsi/CrashTuner/blob/master/detail/YARN-9248.md) | ContainerId |
| [YARN-9194](https://issues.apache.org/jira/browse/YARN-9194) | Major | Fixed | [YARN-9194_6.patch](https://issues.apache.org/jira/secure/attachment/12955092/YARN-9194_6.patch)  | [YARN-9194](https://github.com/lujiefsi/CrashTuner/blob/master/detail/YARN-9194.md) | ApplicationId |
| [MR-7178](https://issues.apache.org/jira/browse/MAPREDUCE-7178) | Major | Unresolved |[MR-7178_1.patch]( https://issues.apache.org/jira/secure/attachment/12956427/MR-7178_1.patch) | [MR-7178](https://github.com/lujiefsi/CrashTuner/blob/master/detail/MR-7178.md) | TaskAttemptId |
| [HBASE-21740](https://issues.apache.org/jira/browse/HBASE-21740) | Major | Fixed |[HBASE-21740.patch](https://issues.apache.org/jira/secure/attachment/12959012/0001-fix-HBASE-21740.patch)| [HBASE-21740](https://github.com/lujiefsi/CrashTuner/blob/master/detail/HBASE-21740.md)  | MetricsRegionServer |
| [HBASE-22023](https://issues.apache.org/jira/browse/HBASE-22023) | Trivial | Unresolved |[master.patch](https://issues.apache.org/jira/secure/attachment/12966775/0001-fix-HBASE-22023-on-master.patch) | [HBASE-22023](https://github.com/lujiefsi/CrashTuner/blob/master/detail/HBASE-22023.md)  | MetricsRegionServer |
| [YARN-8650](https://issues.apache.org/jira/browse/YARN-8650) | Major | Fixed | [YARN-8331.002.patch](https://issues.apache.org/jira/secure/attachment/12934881/YARN-8331.002.patch) | [YARN-8650](https://github.com/lujiefsi/CrashTuner/blob/master/detail/YARN-8650.md) | ContainerId |
| [CASSANDRA-15131](https://issues.apache.org/jira/browse/CASSANDRA-15131) | Normal | Unresolved | [PULL-322](https://github.com/apache/cassandra/pull/322) | [CASSANDRA-15131](https://github.com/lujiefsi/CrashTuner/blob/master/detail/CASSANDRA-15131) | InetAddressAndPort |

## Reproduce

There are two ways to reproduce the bugs found by CrashTuner.

1. We have written some unit tests in patches, you can change the source code to re-test them.
2. We have provide a docker image to reproduce all new bugs, see  [document](TODO)  or [video](TODO) .



## Portability

Currently, we only apply CrashTuner on the distributed system that written in java(all our studied bugs exists in [old bugs](https://github.com/lujiefsi/CrashTuner/tree/master/detail/old bugs), but we also investigate the distributed system written by other language, like [K8s](https://kubernetes.io/) written in **Golang**. We find that CrashTuner can also help it improve the reliability. our studied bugs in  k8s are in [k8sbugs](https://github.com/lujiefsi/CrashTuner/tree/master/detail/old bugs/k8s)(sorry about the document is written in Chinese,  English reader can click the URL in each document goto the corresponding issue) and we are implementing another version CrashTuner to detect them.

We believe that CrashTuner has good portability and we are doing large work on different distributed systems.

  

## Others

### How to determine the bug Priority?

JIRA has 5 level Priority: Blocker, Critical, Major(Cassandra is Normal), Minor and Trivial

When we create a bug issue, JIRA will assign a default Priority as "Major". If the origin developers think the bug has more serious affection,  they will change the Priority as Critical or Blocker, like [YARN-9194](<https://issues.apache.org/jira/browse/YARN-9194>). Of course, some bugs' affections are not  serious as we think, the origin developers will change their Priority  as Minor or Trivial, like  [HBASE-22023](<https://issues.apache.org/jira/browse/HBASE-22023>).

## Cooperation

if you want CrashTuner to improve your business distributed system reliability, please contact market@tianqisoft.cn, or 0574-87630862.



