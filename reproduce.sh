version="v0.8.6"

#YARN-9223
# echo "Processing bug YARN-9223" 
# ./restart.sh >/dev/null 2>&1
# ./DisReproduce.sh NullP YARN_9223 $version >/dev/null 2>&1
# docker cp -a hadoop11:/home/test/DisReproduce/logs/ ./
# echo "" >> ./result.txt
# echo "=====================================BugLink:==========================================" >> ./result.txt
# echo "" >> ./result.txt
# ./get_result.sh NullP YARN_9223 >> ./result.txt
echo "" > ./result.txt
#YARN-9238
echo "Processing bug YARN-9238"
./restart.sh >/dev/null 2>&1
./DisReproduce.sh NullP YARN_9238 $version >/dev/null 2>&1
docker cp -a hadoop11:/home/test/DisReproduce/logs/ ./
echo "" >> ./result.txt
echo "=====================================BugLink:==========================================" >> ./result.txt
echo "https://issues.apache.org/jira/browse/YARN-9238" >> ./result.txt
./get_result.sh NullP YARN_9238 >> ./result.txt

#YARN-9248
echo "Processing bug YARN_9248"
./restart.sh >/dev/null 2>&1
./DisReproduce.sh InvalidStateTransitionException YARN_9248 $version >/dev/null 2>&1
docker cp -a hadoop11:/home/test/DisReproduce/logs/ ./
echo "" >> ./result.txt
echo "=====================================BugLink:==========================================" >> ./result.txt
echo "https://issues.apache.org/jira/browse/YARN-9248" >> ./result.txt
./get_result.sh InvalidStateTransitionException YARN_9248 >> ./result.txt

#HDFS_14372
echo "Processing bug HDFS_14372"
./restart.sh >/dev/null 2>&1
./DisReproduce.sh NullP HDFS_14372 $version >/dev/null 2>&1
docker cp -a hadoop11:/home/test/DisReproduce/logs/ ./
echo "" >> ./result.txt
echo "=====================================BugLink:==========================================" >> ./result.txt
echo "https://issues.apache.org/jira/browse/HDFS-14372" >> ./result.txt
./get_result.sh NullP HDFS_14372 >> ./result.txt

#YARN-9165
echo "Processing bug YARN-9165"
./restart.sh >/dev/null 2>&1
./DisReproduce.sh NullP YARN_9165 $version >/dev/null 2>&1
docker cp -a hadoop11:/home/test/DisReproduce/logs/ ./
echo "" >> ./result.txt
echo "=====================================BugLink:==========================================" >> ./result.txt
echo "https://issues.apache.org/jira/browse/YARN-9165" >> ./result.txt
./get_result.sh NullP YARN_9165 >> ./result.txt

#YARN-9201
echo "Processing bug YARN-9201"
./restart.sh >/dev/null 2>&1
./DisReproduce.sh InvalidStateTransitionException YARN_9201 $version >/dev/null 2>&1
docker cp -a hadoop11:/home/test/DisReproduce/logs/ ./
echo "" >> ./result.txt
echo "=====================================BugLink:==========================================" >> ./result.txt
echo "https://issues.apache.org/jira/browse/YARN-9201" >> ./result.txt
./get_result.sh InvalidStateTransitionException YARN_9201 >> ./result.txt

#YARN-8649
echo "Processing bug YARN-8649"
./restart.sh >/dev/null 2>&1
./DisReproduce.sh NullP YARN_8649 $version >/dev/null 2>&1
docker cp -a hadoop11:/home/test/DisReproduce/logs/ ./
echo "" >> ./result.txt
echo "=====================================BugLink:==========================================" >> ./result.txt
echo "https://issues.apache.org/jira/browse/YARN-8649" >> ./result.txt
./get_result.sh NullP YARN_8649 >> ./result.txt

#YARN-9201
echo "Processing bug YARN-9194"
./restart.sh >/dev/null 2>&1
./DisReproduce.sh InvalidStateTransitionException YARN_9194 $version >/dev/null 2>&1
docker cp -a hadoop11:/home/test/DisReproduce/logs/ ./
echo "" >> ./result.txt
echo "=====================================BugLink:==========================================" >> ./result.txt
echo "https://issues.apache.org/jira/browse/YARN-9194" >> ./result.txt
./get_result.sh InvalidStateTransitionException YARN_9194 >> ./result.txt

#HBASE_22017
echo "Processing bug HBASE_22017"
./restart.sh >/dev/null 2>&1
./DisReproduce.sh LeaseException HBASE_22017 $version >/dev/null 2>&1
docker cp -a hadoop11:/home/test/DisReproduce/logs/ ./
echo "" >> ./result.txt
echo "=====================================BugLink:==========================================" >> ./result.txt
echo "https://issues.apache.org/jira/browse/HBASE_22017" >> ./result.txt
./get_result.sh LeaseException HBASE_22017 >> ./result.txt

#HBASE_22041
echo "Processing bug HBASE_22041"
./restart.sh >/dev/null 2>&1
./DisReproduce.sh hbase-test-master-hadoop11.log HBASE_22041 $version >/dev/null 2>&1
docker cp -a hadoop11:/home/test/DisReproduce/logs/ ./
echo "" >> ./result.txt
echo "=====================================BugLink:==========================================" >> ./result.txt
echo "https://issues.apache.org/jira/browse/HBASE-22041" >> ./result.txt
./get_result.sh hbase-test-master-hadoop11.log HBASE_22041 >> ./result.txt

#HBASE_22050
echo "Processing bug HBASE_22050"
./restart.sh >/dev/null 2>&1
./DisReproduce.sh NullP HBASE_22050 $version >/dev/null 2>&1
docker cp -a hadoop11:/home/test/DisReproduce/logs/ ./
echo "" >> ./result.txt
echo "=====================================BugLink:==========================================" >> ./result.txt
echo "https://issues.apache.org/jira/browse/HBASE-22050" >> ./result.txt
./get_result.sh NullP HBASE_22050 >> ./result.txt

#HBASE_21740
echo "Processing bug HBASE_21740"
./restart.sh >/dev/null 2>&1
./DisReproduce.sh NullP HBASE_21740 $version >/dev/null 2>&1
docker cp -a hadoop11:/home/test/DisReproduce/logs/ ./
echo "" >> ./result.txt
echo "=====================================BugLink:==========================================" >> ./result.txt
echo "https://issues.apache.org/jira/browse/HBASE-21740" >> ./result.txt
./get_result.sh NullP HBASE_21740 >> ./result.txt

#HBASE_22023
echo "Processing bug HBASE_22023"
./restart.sh >/dev/null 2>&1
./DisReproduce.sh NullP HBASE_22023 $version >/dev/null 2>&1
docker cp -a hadoop11:/home/test/DisReproduce/logs/ ./
echo "" >> ./result.txt
echo "=====================================BugLink:==========================================" >> ./result.txt
echo "https://issues.apache.org/jira/browse/HBASE-22023" >> ./result.txt
./get_result.sh NullP HBASE_22023 >> ./result.txt

#HDFS_14216
echo "Processing bug HDFS_14216"
./restart.sh >/dev/null 2>&1
./DisReproduce.sh NullP HDFS_14216 $version >/dev/null 2>&1
docker cp -a hadoop11:/home/test/DisReproduce/logs/ ./
echo "" >> ./result.txt
echo "=====================================BugLink:==========================================" >> ./result.txt
echo "https://issues.apache.org/jira/browse/HDFS-14216" >> ./result.txt
./get_result.sh NullP HDFS_14216 >> ./result.txt

echo "Do aftermath"
./restart.sh >/dev/null 2>&1
rm ./logs/driver.log
rm ./logs/service.log
rm ./id_rsa.pub.hadoop11
rm ./id_rsa.pub.hadoop12
rm ./id_rsa.pub.hadoop13
echo "Finished"




