#Nomer 1a
cat syslog.log|cut -d " " -f1-|grep -o '[ERROR|INFO].*' 

#Nomer 1b
cat syslog.log|cut -d ":" -f4|cut -d "(" -f1|grep ERROR|sort|uniq -c|sort -nr

#Nomer 1c
#Show Error
cat syslog.log|grep ERROR|cut -d "(" -f2|cut -d ")" -f1|sort|uniq -c
#Show Info
cat syslog.log|grep INFO|cut -d "(" -f2|cut -d ")" -f1|sort|uniq -c

#Nomer 1d
#echo "1d is done"
errormessage=`cat syslog.log|cut -d ":" -f4|cut -d "(" -f1|grep ERROR|cut -d " " -f3-|sort|uniq -c|sort -nr `
echo "$errormessage"|
while read checkerror
do
 logmessage=`echo $checkerror|cut -d " " -f2-`
  totalerror=`echo $checkerror|cut -d " " -f1`
 echo "$logmessage,$totalerror"
done|sed '1 i\Error,Count' > error_message.csv

#Nomer 1e
#echo "1e is done"
username=`cat syslog.log|cut -d "(" -f2|cut -d ")" -f1|sort|uniq`
echo "$username"|
while read name
do 
 totalerror=`cat syslog.log|grep -o "ERROR.*($name)"|wc -l`
 totalinfo=`cat syslog.log|grep -o "INFO.*($name)"|wc -l`
 echo "$name,$totalinfo,$totalerror"
done|sed '1 i\username,Info,Error' >  user_statistic.csv
