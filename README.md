# Praktikum-Sisop-Soal-Shift-Modul-1
Repository for the solution to the module's question :coffee:

**Soal 1**
1a)Collects information from application logs contained in the syslog.log file. The information required includes: log type (ERROR / INFO), log messages, and the username on each log line. Since Ryujin finds it difficult to check one line at a time manually, he uses regex to make his job easier. Help Ryujin create the regex.

Code :
cat syslog.log|cut -d ":" -f4

So in question number 1a we are asked to display INFO / ERROR, display log massages, and display username on each log line.Our first step is to create cat. The function of this cat is to show all the information that we want to display.Syslog.log This is to print all the information / files that already exist.Then we use cut to take the info / information and cut it. Cut it from: first to: third. That's why we use -f4. So that later only INFO / ERROR, log massages and age will appear or display.

1b)Then, Ryujin must display all error messages that appear along with the number of occurrences.

Code :
cat syslog.log|cut -d ":" -f4|cut -d "(" -f1|grep ERROR|sort|uniq -c

So in question number 1b we are asked to display all error messages that appear along with the number of occurrences.Number 1b is actually quite similar to the question in number 1a.But the difference is in number 1b, we are only told to display the ERROR and also the log massages.Our first step is to create cat. The function of this cat is to show all the information that we want to display.Syslog.log This is to print all the information / files that already exist.Then we use cut to take the info / information and cut it. Cut it from: first to: third. That's why we use -f4. So that later only ERROR log massages and age will appear or display.In number 1b, we use grep ERROR to only display the ERROR.cut -d "(" -f1 In the next cut we only cut / display information from the first argument to the sign (the first one.Here we also use sort to sort them alphabetically. Finally, we use uniq -c to display one of the data, which is actually a lot of data. So that the data is printed only once.So in the end, it will only bring up the ERROR and log massages and display how many ERRORs and log messages are displayed.

