# Solution of "Soal Shift Sisop Modul 1" - Group I05
Repository for the solution to the module's question :coffee:

# Question 1

**a) Collects information from application logs contained in the syslog.log file. The information required includes: log type (ERROR / INFO), log messages, and the username on each log line. Since Ryujin finds it difficult to check one line at a time manually, he uses regex to make his job easier. Help Ryujin create the regex.**

**Code :**
```
cat syslog.log|cut -d ":" -f4
```
So in question number 1a we are asked to display INFO / ERROR, display log massages, and display username on each log line.Our first step is to create cat. The function of this cat is to show all the information that we want to display.Syslog.log This is to print all the information / files that already exist.Then we use cut to take the info / information and cut it. Cut it from: first to: third. That's why we use -f4. So that later only INFO / ERROR, log massages and age will appear or display.

**b) Then, Ryujin must display all error messages that appear along with the number of occurrences.**

**Code :**
```
cat syslog.log|cut -d ":" -f4|cut -d "(" -f1|grep ERROR|sort|uniq -c
```
So in question number 1b we are asked to display all error messages that appear along with the number of occurrences.Number 1b is actually quite similar to the question in number 1a.But the difference is in number 1b, we are only told to display the ERROR and also the log massages.Our first step is to create cat. The function of this cat is to show all the information that we want to display.Syslog.log This is to print all the information / files that already exist.Then we use cut to take the info / information and cut it. Cut it from: first to: third. That's why we use -f4. So that later only ERROR log massages and age will appear or display.In number 1b, we use grep ERROR to only display the ERROR.cut -d "(" -f1 In the next cut we only cut / display information from the first argument to the sign (the first one.Here we also use sort to sort them alphabetically. Finally, we use uniq -c to display one of the data, which is actually a lot of data. So that the data is printed only once.So in the end, it will only bring up the ERROR and log massages and display how many ERRORs and log messages are displayed.

# Question 2

**a) Steven wants to appreciate the performance of his employees so far by knowing Row ID and the largest profit percentage (if the largest profit percentage is more than 1, take the largest Row ID). To make your work easier, Clemong provides the definition of profit percentage, i.e.:**
```
Profit Percentage = (Profit - Cost Price) 100

Cost Price is obtained from the reduction of Sales with Profit. (Quantity ignored).
```

**Code:**
```
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
```
First of all we need to create the awk program. Awk is a scripting language used for manipulating data and generating reports.The awk command programming language requires no compiling, and allows the user to use variables, numeric functions, string functions, and logical operators. Then we write the ```-F "\t"``` to tell the program that the data that we used is separated by the column (tab). Next, we initialized the profit_percetage to 0 to let the if statement below can be executed. We jump in to the if statement. In this statement we put the formula that have been given before from the question. $21 means the profit column. $18 means the sales column. It is same as the formula to calculate the profit percentage from the data. We keep doing it until the largest profit percentage is more than 1, then we take the largest row. Afte that, We tell the program that we process the data or we get the data from the Laporan-TokoSisop.tsv and we put the result in the hasil.txt by wrinting their directory and using the ">" to transfer the result.

**b) A list of customer names on the 2017 transaction in Albuquerque.**

**Code:**
```
awk -F "\t" '
$2~/2017/ && $10~/Albuquerque/ {row[$7]++}
BEGIN {
	printf("The list of customer name in Albuquerque in 2017 includes:\n")
}
END {
        for(customer_name in row)
        {
                printf("%s\n", customer_name)
	}

        printf("\n")
}
' /home/rafihayla/Downloads/Laporan-TokoShiSop.tsv >> /home/rafihayla/Documents/soal-shift-sisop-modul-1-I05-2021/soal2/hasil.txt
```
Before the awk begin, we need to declare $2~/2017/ && $10~/Albuquerque/ {row[$7]++}. $2~/2017/ means the order id column in 2017 and $10~/Albuquerque means the city in Albuquerque. {row[$7]++} means we check the customer name column. Next, we check the customer_name in row. Then we print the customer names on the 2017 transaction in Albuquerque. Same as before. Now we tell the computer that we overwrite the file before. We get the data from Laporan-TokoShisSop.tsv and process it then the result will in the hasil.txt. Also write those directory. The difference between the first one is the ">" and the ">". ">" is for the initial one. ">>" is for the overwrite the old file and update it.

**c) A customer segment and the number of transactions with the least amount of transactions.**

**Code:**
```
awk -F "\t" '
$8~/Home Office/ || $8~/Consumer/ || $8~/Corporate/ {seg[$8]++}
END {
	# Initialize the transactions into a big value to runs the if
	# statement in order to get the lowest transactions
	transactions = 999999;
	segment;

	for(cust_seg in seg)
	{
		if(transactions > seg[cust_seg])
		{
			segment = cust_seg;
			transactions = seg[cust_seg]
		}
	}

	printf("The type of customer segment with the least sales is %s with %d transaction.\n\n",segment,transactions)
}
' /home/rafihayla/Downloads/Laporan-TokoShiSop.tsv >> /home/rafihayla/Documents/soal-shift-sisop-modul-1-I05-2021/soal2/hasil.txt 
```
The awk started by processing and checking the data from the segment column just like we declared it before. Then, we initialize the transactions into a big value to runs the if statement in order to get the lowest transactions. We just simplify declare transaction = 999999. Because from the data we know that the max transaction is only 9994. Then we check the cust_seg in the segment column. If the transaction is more than the seg[cust_reg], we pass the cust_seg value into segment and also the seg[cust_seg] value into transactions. Also, we overwrite and update the file to the hasil.txt

**d) Region that has the least total profit and the total profit of that region.**

**Code:**
```
awk -F "\t" '
{
	# NR = Number of Records (awk built-in variable)
	if(NR>1)
	{region_profit[$13] = region_profit[$13] +  $21}
}
END {
	# Set total_profit into a big value to runs the if statement in
	# order to get the total of lowest profit
	total_profit = 99999;
	region;

	for(reg in region_profit)
	{
		if(total_profit > region_profit[reg])
		{
			total_profit = region_profit[reg];
			region = reg;
		}
	}

	printf("The region which has the least total profit is %s with total profit %d\n",region,total_profit)
}
' /home/rafihayla/Downloads/Laporan-TokoShiSop.tsv >> /home/rafihayla/Documents/soal-shift-sisop-modul-1-I05-2021/soal2/hasil.txt 
```
We initialized the NR>1 to proceed the data. NR means the number of records which is the awk built-in variable. Then we add the region_profit which contains the value of region column and add it with the value of profit column. Again we just simplify declare the total_profit as 99999. As we know from the data that the profit is not more than the 99999. As long as the total profit is more than the region_profit[reg], we input the value from region_profit[reg] into the total_profit and reg value into region. The last thing we overwrite the hasil.txt that we already made before and update it again.

**e) Create a script that will produce a file named Hasil.txt.**

**Code:**
```
nano hasil.txt
```
Before we started. We make the hasil.txt first by nano hasil.txt. After that we make another by doing nano soal2_generate_laporan_ihir_shisop.sh. Then we do the code overthere and to showing the result to hasil.txt We write their directory just like did before. /home/rafihayla/Downloads/Laporan-TokoShiSop.tsv >> /home/rafihayla/Documents/soal-shift-sisop-modul-1-I05-2021/soal2/hasil.txt. Just to remember, "<" for the initial one and "<<" for update it.

3 a.) 
Question Analysis:
First, we are asked to download some images from https://loremflickr.com/320/240/kitten for about 23 times. After that we are asked to save the log file into Foto.log and rename the downloaded files into Koleksi_XX. There is a special rule where we must delete any duplicate image. Also the Koleksi_XX must be in order.

Solution:
Because we need to download the images for about 23 times, we will use loops (for this case we will use for-loop). For the special rule, we will use a helpful tool called fdupes where it will remove duplicates found on point. We use the syntax -dN to get a more automatic deletion of the duplicate images. After that we know that we will use wget to download from url, but we must also save both the log files and rename the downloaded files. We can use -a to save the log files into Foto.log and -O to rename the files into Koleksi_XX

Source Code:
```
for ((counter=1; counter<=23; counter=counter+1))
do
	wget -a Foto.log -O Koleksi_$counter https://loremflickr.com/320/240/kitten
	fdupes -dN /home/alvancho
done
```

b.) 
Question Analysis:
Here, we are asked to make a schedule to download the images in a specific time  The script must be run at 8 pm every month with 2 special condition which is the first day of every seven days and the second days every four days. Also the downloaded images must be moved into a folder with the format of the download date (DD-MM-YY)

Solution: 
We can use crontab to make a schedule to run a command on appointed date. First, we make a script which is soal3b.sh where in the script we will run the soal3a.sh script, then make a folder with the format DD-MM-YYYY. We then need to move the result from the first script into the newly created folder using mv for both the images and the log.
```
crontab guru
0 20 1-31/7,2-31/4 * *
At 20:00 on every 7th day-of-month from 1 through 31 and every 4th day-of-month from 2 through 31

Source Code:
(cron3b.tab)
0 20 1-31/7,2-31/4 * * bash ./home/alvancho/soal3b.sh

(soal3b.sh)
#!/bin/bash
bash ./soal3a.sh
mkdir /home/alvancho/$(date +%d-%m-%Y)
mv Koleksi_* /home/alvancho/$(date +%d-%m-%Y)
mv Foto.log /home/alvancho/$(date +%d-%m-%Y)
```
c.) From what we understand, we need to download both rabbit and cat images alternatively then the folders are named with Kucing_ or Rabbit_
We want to try using the same logic on 3a but hasn't been successful yet.

*We manage to find how to do both 3d and 3e but hasn't been succesful on 3c yet.

d.) We are asked to move entire folder to zip -> Koleksi.zip and lock the zip with a password with format of MMDDYYYY

-q = quiet
-P = Password
-r = recurse-paths
-m = move

Source Code:
zip -q -P `date +"%m%d%Y"` -r -m Koleksi.zip ./Kucing* ./Kelinci*

e.) When kuuhaku goes to college from 7am to 6pm he want us to zip the collection and when he's not in college we can unzip it

-q = quiet
-P = Password
-r = recurse-paths
-m = move

crontab guru
0 7 * * 1-5
At 07:00 on every day-of-week from Monday through Friday
0 18 * * 1-5
At 18:00 on every day-of-week from Monday through Friday

Source code:
0 7 * * 1-5 zip -q -P `date +"%m%d%Y"` -r Koleksi.zip ./Kucing* ./Kelinci*
0 18 * * 1-5 unzip -q -P `date +"%m%d%Y"` Koleksi.zip && rm Koleksi.zip
