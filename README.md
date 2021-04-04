# Solution of "Soal Shift Sisop Modul 1" - Group I05

**Rafi Akbar Rafsanjani - 05111942000004**

**Agustinus Aldi Irawan Rahardja - 05111942000010**

**Muhammad Rafi Hayla Arifa - 05111942000014**

Repository for the solution to the module's question :coffee:

# Question 1

**a) Collects information from application logs contained in the syslog.log file. The information required includes: log type (ERROR / INFO), log messages, and the username on each log line. Since Ryujin finds it difficult to check one line at a time manually, he uses regex to make his job easier. Help Ryujin create the regex.**

**Source Code**
```
cat syslog.log|cut -d " " -f1-|grep -o '[ERROR|INFO].*' 
```
**Explanation**

So in question number 1a we are asked to display INFO / ERROR, display log massages, and display username on each log line.Our first step is to create cat. The function of this cat is to show all the information that we want to display.Syslog.log This is to print all the information / files that already exist.Then we use cut to take the info / information and cut it. -f1 to read spaces from 0 to the last line. So that later only INFO / ERROR, log massages and age will appear or display.

**Documentation**

![1617512691435](https://user-images.githubusercontent.com/61174498/113499705-41d83280-9542-11eb-81bf-4e5b5ca31d78.jpg)

**b) Then, Ryujin must display all error messages that appear along with the number of occurrences.**

**Source Code**
```
cat syslog.log|cut -d ":" -f4|cut -d "(" -f1|grep ERROR|sort|uniq -c
```
**Explanation**

So in question number 1b we are asked to display all error messages that appear along with the number of occurrences.Number 1b is actually quite similar to the question in number 1a.But the difference is in number 1b, we are only told to display the ERROR and also the log massages.Our first step is to create cat. The function of this cat is to show all the information that we want to display.Syslog.log This is to print all the information / files that already exist.Then we use cut to take the info / information and cut it. Cut it from: first to: third. That's why we use -f4. So that later only ERROR log massages and age will appear or display.In number 1b, we use grep ERROR to only display the ERROR.cut -d "(" -f1 In the next cut we only cut / display information from the first argument to the sign (the first one.Here we also use sort to sort them alphabetically. Finally, we use uniq -c to display one of the data, which is actually a lot of data. So that the data is printed only once.So in the end, it will only bring up the ERROR and log massages and display how many ERRORs and log messages are displayed.

**Documentation**

![1617512860641](https://user-images.githubusercontent.com/61174498/113499710-4dc3f480-9542-11eb-806c-a6c53de511ab.jpg)

**c) Ryujin must also be able to display the number of occurrences of the ERROR and INFO logs for each user.
After all the necessary information has been prepared, now is the time for Ryujin to write all the information into a report in the csv file format.**

**Source Code**
```
#Show Error
cat syslog.log|grep ERROR|cut -d "(" -f2|cut -d ")" -f1|sort|uniq -c
#Show Info
cat syslog.log|grep INFO|cut -d "(" -f2|cut -d ")" -f1|sort|uniq -c
```
**Explanation**

In number 1c we are asked to display the usename info and the error.For errors, as usual we use cat syslog.log to display all available data. Then we cut it so that later it will only show the usernames.For errors, as usual we use cat syslog.log to display all available data. Then we cut it so that later it will only show the usernames.

**Documentation**

![1617512872124](https://user-images.githubusercontent.com/61174498/113499720-5d433d80-9542-11eb-8c2f-fbcf88bbe8b5.jpg)

**d) All information obtained in point b is written into the error_message.csv file with the Error, Count header, which is then followed by a list of error messages and the number of occurrences is ordered based on the number of occurrence of error messages from the most.**

**Source Code**
```
#echo "1d is done"
errormessage=`cat syslog.log|cut -d ":" -f4|cut -d "(" -f1|grep ERROR|cut -d " " -f3-|sort|uniq -c|sort -nr `
echo "$errormessage"|
while read checkerror
do
	logmessage=`echo $checkerror|cut -d " " -f2-`
 	totalerror=`echo $checkerror|cut -d " " -f1`
	echo "$logmessage,$totalerror"
done|sed '1 i\Error,Count' > error_message.csv
```
**Explanation**

For question number 1d, we are asked to calculate and generate the error message. So first we declare the error message variable. Then ":" -f4 is here to get rid of the date. "(" to remove the username. Then "" is to retrieve log messages only without the word error.Here we use while read to retrieve only the numbers and tables.After that we declare the new variable logmessage = `echo $ checkerror | cut -d" "-f2-` totalerror = `echo $ checkerror | cut -d" "-f1`. Checkerror to check the error message and Totalerror to calculate the number of errors. There we cut it again so that later only the message log appears.After that we print the variables that we have declared before. When finished, we use sed to input into a file. Error and Count to display the log message and calculate it. Then after that we just need to write to the file name error_message.csv

**Documentation**

![1617512894648](https://user-images.githubusercontent.com/61174498/113499757-a09dac00-9542-11eb-9140-e87ddf44ff7c.jpg)

**e) All information obtained in point c is written into the user_statistic.csv file with the header Username, INFO, ERROR sorted by username in ascending order.**

**Source Code**
```
username=`cat syslog.log|cut -d "(" -f2|cut -d ")" -f1|sort|uniq`
echo "$username"|
while read name
do 
	totalerror=`cat syslog.log|grep -o "ERROR.*($name)"|wc -l`
	totalinfo=`cat syslog.log|grep -o "INFO.*($name)"|wc -l`
	echo "$name,$totalinfo,$totalerror"
done|sed '1 i\username,Info,Error' >  user_statistic.csv
```
**Explanation**
In number 1e this is actually quite similar to the number 1d before. We are asked to display the username with the info and the error. First we declare the username variable first. The contents are the same as the number 1c.cut -d "(" -f2 | cut -d " ) "-f1 so that later only the usernames will be read without (). Then we sort them alphabetically from a to z.After that we print the previously declared variables. Here we also use while read. Then we declare totalerror again to calculate the number of errors as well as totalinfo. We use "ERROR. * ($ Name)" to tell the error whose username. Likewise with "INFO. * ($ Name)".We use wc -l to compute the same line.After that we print the name, totalerror, totalinfo.When finished we make it sad to input it into a file. What we display is the username, info, and the error. After that we make the file name user_statistic.csv

**Documentation**

![1617512927057](https://user-images.githubusercontent.com/61174498/113499740-819f1a00-9542-11eb-8909-0fe73f0172af.jpg)

# Question 2

**a) Steven wants to appreciate the performance of his employees so far by knowing Row ID and the largest profit percentage (if the largest profit percentage is more than 1, take the largest Row ID). To make your work easier, Clemong provides the definition of profit percentage, i.e.:**
```
Profit Percentage = (Profit - Cost Price) 100

Cost Price is obtained from the reduction of Sales with Profit. (Quantity ignored).
```

**Source Code**
```
awk -F "\t" '
BEGIN {{profit_percentage = 0}} 
{
	if((($21 / ($18 - $21)) * 100) >= profit_percentage)
	{
		profit_percentage = (($21 / ($18 - $21) ) * 100);
		transaction_id = $1
	}
}
END {
	printf ("The last transaction with the largest %d with a percentage of %.2f%%.\n\n", transaction_id, profit_percentage)
}
' /home/rafihayla/Downloads/Laporan-TokoShiSop.tsv > /home/rafihayla/Downloads/soal-shift-sisop-modul-1-I05-2021/soal2/hasil.txt
```
**Explanation**

First of all we need to create the awk program. Awk is a scripting language used for manipulating data and generating reports.The awk command programming language requires no compiling, and allows the user to use variables, numeric functions, string functions, and logical operators. Then we write the ```-F "\t"``` to tell the program that the data that we used is separated by the column (tab). Next, we initialized the ```profit_percetage``` to 0 to let the if statement below can be executed. We jump in to the if statement. In this statement we put the formula that have been given before from the question. ```$21``` means the profit column. ```$18``` means the sales column. It is same as the formula to calculate the profit percentage from the data. We compare it to the ```profit_percentage``` which is 0 before. After that we compare it again the calculation of the data by using the formula with the new ```profit_percentage``` which we get by applying the formula again. And compare it again the new calculation of ```profit_percentage``` with the previous one. After that, We tell the program that we process the data or we get the data from the ```Laporan-TokoSisop.tsv``` and we put the result in the ```hasil.txt``` by wrinting their directory and using the ```">"``` to transfer the result.

**Documentation**

<img width="677" alt="Screen Shot 2021-04-02 at 22 07 34" src="https://user-images.githubusercontent.com/74056954/113427839-f3bb1600-93ff-11eb-96bf-c2c9c2509585.png">


**b) A list of customer names on the 2017 transaction in Albuquerque.**

**Source Code**
```
awk -F "\t" '
$2~/2017/ && $10~/Albuquerque/ {row[$7]++}
	
END {
	printf("The list of customer name in Albuquerque in 2017 includes:\n")
        for(customer_name in row)
        {
                printf("%s\n", customer_name)
	}

        printf("\n")
}
' /home/rafihayla/Downloads/Laporan-TokoShiSop.tsv >> /home/rafihayla/Downloads/soal-shift-sisop-modul-1-I05-2021/soal2/hasil.txt
```
**Explanation**

Before the awk begin, we need to declare ```$2~/2017/ && $10~/Albuquerque/ {row[$7]++}```. ```$2~/2017/``` means the order id column in 2017 and ```$10~/Albuquerque``` means the city in Albuquerque. ```{row[$7]++}``` means we check the customer name column one by one. Next, we check the ```customer_name``` in row. Then we print the customer names on the 2017 transaction in Albuquerque. Same as before. Now we tell the computer that we update the file ```hasil.txt```before. We get the data from ```Laporan-TokoShisSop.tsv``` and process it then the result will in the ```hasil.txt```. Also write those directory. The difference between the first one is the ```">"``` and the ```">>"```. ```">"``` is for the initial one. ```">>"``` is to update it without deleting the old one.

**Documentation**

<img width="681" alt="Screen Shot 2021-04-02 at 22 09 05" src="https://user-images.githubusercontent.com/74056954/113427891-0d5c5d80-9400-11eb-96d2-d932cb2f0ef7.png">


**c) A customer segment and the number of transactions with the least amount of transactions.**

**Source Code**
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
' /home/rafihayla/Downloads/Laporan-TokoShiSop.tsv >> /home/rafihayla/Downloads/soal-shift-sisop-modul-1-I05-2021/soal2/hasil.txt 
```
**Explanation**

The awk started by processing and checking the data from the ```segment``` column just like we declared it before either home office, consumer, or corporate. Then, we initialize the ```transactions``` into a big value to runs the if statement in order to get the lowest transactions. We just simplify declare ```transaction = 999999```. Because from the data we know that the max transaction is only 9994. Then we check the cust_seg in the segment column. If the transaction is more than the ```seg[cust_reg]```, we pass the ```cust_seg``` value into ```segment``` and also the ```seg[cust_seg]``` value into ```transactions```. Also, we update the file to the ```hasil.txt``` without deleting the previous one.

**Documentation**

<img width="682" alt="Screen Shot 2021-04-02 at 22 09 52" src="https://user-images.githubusercontent.com/74056954/113427959-282ed200-9400-11eb-8b1f-0a04d6106edb.png">

**d) Region that has the least total profit and the total profit of that region.**

**Source Code**
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
' /home/rafihayla/Downloads/Laporan-TokoShiSop.tsv >> /home/rafihayla/Downloads/soal-shift-sisop-modul-1-I05-2021/soal2/hasil.txt 
```
**Explanation**

We initialized the ```NR>1``` to proceed the data. ```NR``` means the number of records which is the awk built-in variable. ```NR>1``` is to avoid the program to read the header of the table. Then we add the ```region_profit``` which contains the value of region column and add it with the value of profit column. Again we just simplify declare the ```total_profit as 99999```. As we know from the data that the profit is not more than the 99999. As long as the ```total profit``` is more than the ```region_profit[reg]```, we input the value from ```region_profit[reg]``` into the ```total_profit``` and ```reg``` value into ```region```. The last thing we update the ```hasil.txt``` that we already made before and update it again.

**Documentation**

<img width="566" alt="Screen Shot 2021-04-02 at 22 11 59" src="https://user-images.githubusercontent.com/74056954/113428139-72b04e80-9400-11eb-9b50-064c6e364627.png">


**e) Create a script that will produce a file named Hasil.txt.**

**Source Code**
```
nano hasil.txt
```
**Explanation**

Before we started. We make the ```hasil.txt``` first by ```nano hasil.txt```. After that we make another by doing ```nano soal2_generate_laporan_ihir_shisop.sh```. Then we do the code overthere and to showing the result to ```hasil.txt```. We write their directory just like did before. ```/home/rafihayla/Downloads/Laporan-TokoShiSop.tsv >> /home/rafihayla/Downloads/soal-shift-sisop-modul-1-I05-2021/soal2/hasil.txt```. Just to remember, ```"<"``` for the initial one and ```"<<"``` for update it.

# Question 3

**0.) Kuuhaku is a person who really likes to collect digital photos, but Kuuhaku is also a lazy person so he doesn't want to bother looking for photos, besides that he is also shy, so he doesn't want anyone to see his collection, unfortunately, he has a friend named Steven who made being nosy his primary responsibility. Kuuhaku then had an idea, a way so that Steven won't be able to see his collection. To make his life easier, he is asking for your help. The idea is:**

**a) Make a script to download 23 images from "https://loremflickr.com/320/240/kitten" and save the logs to the file "Foto.log". Since the downloaded images are random, it is possible that the same image is downloaded more than once, therefore you have to delete the same image (no need to download new images to replace them). Then save the images with the name "Kumpulan_XX" with consecutive numbers without missing any number (example: Koleksi_01, Koleksi_02, ...)**

**Source Code**
```
#!/bin/bash

dirloc=/home/alvancho/Documents/IO5/Soal3

if [ -f $dirloc/Foto.log ]
then
	rm $dirloc/Foto.log
fi

for ((counter=1; counter<=23; counter=counter+1))
    do
    if [ $counter -lt 10 ]
        then wget -a "$dirloc"/Foto.log "https://loremflickr.com/320/240/kitten" -O "$dirloc"/Koleksi_0"$counter".jpg
    else wget -a "$dirloc"/Foto.log "https://loremflickr.com/320/240/kitten" -O "$dirloc"/Koleksi_"$counter".jpg
    fi
done


counter=1
cd "$dirloc"
fdupes -dN "$dirloc"

for f in Koleksi_*.jpg
    do
    if [ $counter -lt 10 ]
        then 
            mv -- "$f" "Koleksi_0$counter.jpg"
    else 
        mv -- "$f" "Koleksi_$counter.jpg"
    fi
let counter=$counter+1
done
```

**Explanation**

First, we are asked to download some images from https://loremflickr.com/320/240/kitten for about 23 times. After that we are asked to save the log file into Foto.log and rename the downloaded files into Koleksi_XX. There is a special rule where we must delete any duplicate image. Also the Koleksi_XX must be in order.
Because we need to download the images for about 23 times, we will use loops (for this case we will use for-loop). For the special rule, we will use a helpful tool called fdupes where it will remove duplicates found on point. We use the syntax -dN to get a more automatic deletion of the duplicate images. After that we know that we will use wget to download from url, but we must also save both the log files and rename the downloaded files. We can use -a to save the log files into Foto.log and -O to rename the files into Koleksi_XX

**Documentaion**

![3a_hasil_5](https://user-images.githubusercontent.com/61174498/113499973-a5fbf600-9544-11eb-92e4-14b0346b3059.png)

![3a_hasil_4](https://user-images.githubusercontent.com/61174498/113499980-ac8a6d80-9544-11eb-8ae0-4af19f737475.png)

**b)Because Kuuhaku is too lazy to run the script manually, he also asks you to run the script once a day at 8 o'clock in the evening for some specific dates every month, namely starting the 1st every seven days (1,8, ...), as well as from the 2nd once every four days (2,6, ...). To tidy it up, the downloaded images and logs are moved to a folder named the download date with the format "DD-MM-YYYY" (example: "13-03-2023").** 

**Source Code**

**soal3b.sh**
```
#!/bin/bash

dirloc=/home/alvancho/Documents/IO5/Soal3

download_date=$(date +"%d-%m-%Y")
mkdir "$download_date"

bash $dirloc/soal3a.sh

mv $dirloc/Foto.log "$dirloc/$download_date/"
mv $dirloc/Koleksi_* "$dirloc/$download_date/"
```

**cron3b.tab**
```
0 20 1-31/7,2-31/4 * * bash /home/alvancho/Documents/IO5/Soal3/soal3b.sh
```

**Explanation**
Here, we are asked to make a schedule to download the images in a specific time  The script must be run at 8 pm every month with 2 special condition which is the first day of every seven days and the second days every four days. Also the downloaded images must be moved into a folder with the format of the download date (DD-MM-YY)
We can use crontab to make a schedule to run a command on appointed date. First, we make a script which is soal3b.sh where in the script we will run the soal3a.sh script, then make a folder with the format DD-MM-YYYY. We then need to move the result from the first script into the newly created folder using mv for both the images and the log.

crontab guru
0 20 1-31/7,2-31/4 * *
At 20:00 on every 7th day-of-month from 1 through 31 and every 4th day-of-month from 2 through 31

**Documentation**



**c.)To prevent Kuuhaku getting bored with pictures of kittens, he also asked you to download rabbit images from "https://loremflickr.com/320/240/bunny". Kuuhaku asks you to download pictures of cats and rabbits alternately (the first one is free. example: 30th cat > 31st rabbit > 1st cat > ...). To distinguish between folders containing cat pictures and rabbit pictures, the folder names are prefixed with "Kucing_" or "Kelinci_" (example: "Kucing_13-03-2023").**

**d.)To secure his Photo collection from Steven, Kuuhaku asked you to create a script that will move the entire folder to zip which is named "Koleksi.zip" and lock the zip with a password in the form of the current date with the format "MMDDYYYY" (example: "03032003").**

-q = quiet
-P = Password
-r = recurse-paths
-m = move

Source Code:
zip -q -P `date +"%m%d%Y"` -r -m Koleksi.zip ./Kucing* ./Kelinci*

**e.)Because kuuhaku only met Steven during college, which is every day except Saturday and Sunday, from 7 am to 6 pm, he asks you to zip the collection during college, apart from the time mentioned, he wants the collection unzipped. and no other zip files exist.**

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
