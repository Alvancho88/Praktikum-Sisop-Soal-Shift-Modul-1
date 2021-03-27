#Nomer 1a
cat syslog.log|cut -d ":" -f4

#Nomer 1b
cat syslog.log|cut -d ":" -f4|cut -d "(" -f1|grep ERROR|sort|uniq -c

