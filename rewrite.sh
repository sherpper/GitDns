PublicIP=`wget -q "http://20140507.ip138.com/ic.asp" -O - | grep '[.*?]' | cut -d[ -f2 | cut -d] -f1`

refetchIP(){
	PublicIP=`wget -q "http://20140507.ip138.com/ic.asp" -O - | grep '[.*?]' | cut -d[ -f2 | cut -d] -f1`
	checkIP
}

checkIP(){
	if [ -z "$PublicIP" ]; then
		refetchIP
	fi
}

checkIP

beforeIP=`cat hosts | grep sherpper | cut -d' ' -f1`

sed -i "/sherpper/s/`echo $beforeIP`/`echo $PublicIP`/" hosts  # notice: the double quotes
exit