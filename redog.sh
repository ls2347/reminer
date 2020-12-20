server_name="cn.sparkpool.com"   #矿池地址  
proc_ping()                      #查询网络
{  
    #向矿池 ping 10次 全部ping不通 则返回 1 掉线
    result=`ping $server_name -c 10 -W 3|grep "100% packet loss"|wc -l`
    return $result  
}
proc_ping
result=$?                       #检查网口是否宕机
if [ $result -eq 1 ]            #如果宕机 则重启  
then                            #重新启动服务器，或者扩展其它内容。  
        /hive/bin/message danger "Miner Down. Force Reboot."
        reboot -f
fi


