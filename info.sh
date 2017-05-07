memTotal_b=`free -b |grep Mem |awk '{print $2}'`
memFree_b=`free -b |grep Mem |awk '{print $4}'`
memBuffer_b=`free -b |grep Mem |awk '{print $6}'`
memCache_b=`free -b |grep Mem |awk '{print $7}'`

memTotal_m=`free -m |grep Mem |awk '{print $2}'`
memFree_m=`free -m |grep Mem |awk '{print $4}'`
memBuffer_m=`free -m |grep Mem |awk '{print $6}'`
memCache_m=`free -m |grep Mem |awk '{print $7}'`
CPUPer=`top -b -n1 | grep "Cpu(s)" | awk '{print $2 + $4}'`
uptime=`uptime`
ProcessCnt=`ps -A | wc -l`
memUsed_b=$(($memTotal_b-$memFree_b-$memBuffer_b-$memCache_b))
memUsed_m=$(($memTotal_m-$memFree_m-$memBuffer_m-$memCache_m))
memUsedPrc=$((($memUsed_b*100)/$memTotal_b))
echo "°• <b>اطلاعات سرور</b>"
echo "➖➖➖➖➖➖➖➖➖➖➖➖"
echo "°• <i>مقدار رم</i> : <b>$memTotal_m MB</b>"
echo "➖➖➖➖➖➖➖➖➖➖➖➖"
echo "°• <i>مقدار رم مورد استفاده</i> : <b>$memUsed_m MB</b>"
echo "➖➖➖➖➖➖➖➖➖➖➖➖"
echo "°• <i>درصد استفاده از رم : </i> <b>$memUsedPrc%</b>"
echo "➖➖➖➖➖➖➖➖➖➖➖➖"
echo '°• <i>مقدار سی پی یو مورد استفاده</i> : <b>'"$CPUPer"'</b>%'
echo "➖➖➖➖➖➖➖➖➖➖➖➖"
echo '°• <i>تعداد فرایندهای درحال اجرا</i> : <b>'"$ProcessCnt"'</b>'
echo "➖➖➖➖➖➖➖➖➖➖➖➖"
echo '°• <i>آپ تایم سرور\n'"$uptime"'</i>'
