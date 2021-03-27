# Pembahasan Soal Shift Sisop Modul 1 oleh grup I05
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

**Question 2**
2a) Steven wants to appreciate the performance of his employees so far by knowing Row ID and the largest profit percentage (if the largest profit percentage is more than 1, take the largest Row ID). To make your work easier, Clemong provides the definition of profit percentage, i.e.:

Profit Percentage = (Profit Cost Price) 100

Cost Price is obtained from the reduction of Sales with Profit. (Quantity ignored).

Code:
awk -F "\t" '
BEGIN {profit_percentage = 0} {
	if((($21 / ($18 - $21)) * 100) > profit_percentage)
	{
		profit_percentage = (($21 / ($18 - $21) ) * 100);
		transaction_id = $1
	}
}
END {
	printf ("The last transaction with the largest %d with a percentage of %.2f%%.\n\n", transaction_id, profit_percentage)
}
' /home/rafihayla/Downloads/Laporan-TokoShiSop.tsv > /home/rafihayla/Documents/soal-shift-sisop-modul-1-I05-2021/soal2/hasil.txt

First of all we need to create the awk program. Awk is a scripting language used for manipulating data and generating reports.The awk command programming language requires no compiling, and allows the user to use variables, numeric functions, string functions, and logical operators. Then we write the -F "\t" to tell the program that the data that we used is separated by the column (tab). Next, we initialized the profit_percetage to 0 to let the if statement below can be executed. We jump in to the if statement. In this statement we put the formula that have been given before from the question. $21 means the profit column. $18 means the sales column. It is same as the formula to calculate the profit percentage from the data. We keep doing it until the largest profit percentage is more than 1, then we take the largest row. Afte that, We tell the program that we process the data or we get the data from the Laporan-TokoSisop.tsv and we put the result in the hasil.txt by wrinting their directory and using the ">" to transfer the result.

2b)




