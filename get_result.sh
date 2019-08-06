astr=$1
bstr=$2
echo "=====================================Result:=========================================="
if [ "$2" = "HBASE_22041" -o "$2" = "HBASE_" ];then
        docker exec -it --user test hadoop11 bash -c "tail -5 /home/test/DisReproduce/logs/$2/$1"
else
        docker exec -it --user test hadoop11 bash -c "grep $1 -r /home/test/DisReproduce/logs/$2/"
fi
echo "======================================================================================"