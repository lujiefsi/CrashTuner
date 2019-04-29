# CrashTuner

## What can you get from this project?
This the report of bugs that found by CrashTuner. We will give the detail of how to trigger each bugs. Besides, we also give a simple version of CrashTuner in docker to show how CrashTuner find these bugs.
## Found bugs
|Bug Id  |Status |patch|Detail|Meta-info|
| :------:  | :------: | :------: | :------: | :------: |
| [YARN-8649](https://issues.apache.org/jira/browse/YARN-8649) | Fixed | [YARN-8649_5.patch](https://issues.apache.org/jira/secure/attachment/12936754/YARN-8649_5.patch) | YARN-8649 | ApplicationId |
| [YARN-8650](https://issues.apache.org/jira/browse/YARN-8650) | Fixed | [YARN-8331.002.patch](https://issues.apache.org/jira/secure/attachment/12934881/YARN-8331.002.patch) | YARN-8649 | ContainerId |
| [YARN-9164](https://issues.apache.org/jira/browse/YARN-9164) | Fixed | [YARN-9164-2.patch](https://issues.apache.org/jira/secure/attachment/12953556/YARN-9164-2.patch) | YARN-8649 | NodeId |
| [YARN-9165](https://issues.apache.org/jira/browse/YARN-9165) | Fixed | [YARN-9164-2.patch](https://issues.apache.org/jira/secure/attachment/12953556/YARN-9164-2.patch) | YARN-8649 | ContainerId |
| [YARN-9193](https://issues.apache.org/jira/browse/YARN-9193) | Fixed | [YARN-9194_6.patch](https://issues.apache.org/jira/secure/attachment/12955092/YARN-9194_6.patch) | YARN-8649 | YARN-8649 |
| [YARN-9194](https://issues.apache.org/jira/browse/YARN-9194) | Fixed | [YARN-9194_6.patch](https://issues.apache.org/jira/secure/attachment/12955092/YARN-9194_6.patch)  | YARN-8649 | YARN-8649 |
| [YARN-9201](https://issues.apache.org/jira/browse/YARN-9201) | Fixed | [YARN-9194_6.patch](https://issues.apache.org/jira/secure/attachment/12955092/YARN-9194_6.patch)  | YARN-8649 | YARN-8649 |
| [MR-7178](https://issues.apache.org/jira/browse/MAPREDUCE-7178) | Unresolved |[MR-7178_1.patch]( https://issues.apache.org/jira/secure/attachment/12956427/MR-7178_1.patch) | YARN-8649 | TaskAttemptId |
| [YARN-9238](https://issues.apache.org/jira/browse/YARN-9238) | Fixed | [YARN-9238_3.patch](https://issues.apache.org/jira/secure/attachment/12959002/YARN-9238_3.patch) | YARN-8649 | YARN-8649 |
| [YARN-9248](https://issues.apache.org/jira/browse/YARN-9248) | Fixed | [YARN-9248_5.patch](https://issues.apache.org/jira/secure/attachment/12956913/YARN-9248_5.patch) | YARN-8649 | YARN-8649 |
| [HBASE-21740](https://issues.apache.org/jira/browse/HBASE-21740) | Fixed |[HBASE-21740.patch](https://issues.apache.org/jira/secure/attachment/12959012/0001-fix-HBASE-21740.patch)| YARN-8649 | YARN-8649 |
| [HBASE-22017](https://issues.apache.org/jira/browse/HBASE-22017) | Fixed | [pull-158](https://github.com/apache/hbase/pull/158) | YARN-8649 | YARN-8649 |
| [HBASE-22023](https://issues.apache.org/jira/browse/HBASE-22023) | Unresolved |[master.patch](https://issues.apache.org/jira/secure/attachment/12966775/0001-fix-HBASE-22023-on-master.patch) | YARN-8649 | YARN-8649 |
| [HBASE-22041](https://issues.apache.org/jira/browse/HBASE-22041)  | Unresolved | - | - | YARN-8649 |
| [HBASE-22050](https://issues.apache.org/jira/browse/HBASE-22050) | Unresolved |[HBASE-22050.patch](https://issues.apache.org/jira/secure/attachment/12962339/0001-fix-HBASE-22050.patch) | YARN-8649 | YARN-8649 |
| [HDFS-14216](https://issues.apache.org/jira/browse/HDFS-14216) | Fixed |[HDFS-14216_6.patch](https://issues.apache.org/jira/secure/attachment/12959591/HDFS-14216_6.patch) | YARN-8649 | DataNodeId |
| [HDFS-14372](https://issues.apache.org/jira/browse/HDFS-14372) | Unresolved | [HDFS-14372_2.patch](https://issues.apache.org/jira/secure/attachment/12964354/HDFS-14372_2.patch) | YARN-8649 | DataNodeInfo |
