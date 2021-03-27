#!/bin/bash


# Question A
# Steven want to appreciate the performance of his employees so far
# by knowing ROW ID and the largest profit percentage
# (if the largest profit percentage is more than 1,
# take the largest ROW ID).
# To make your work easier,
# Clemong provides the definition of profit percentage:
# Profit Percentage = (Profit / Cost Price) x 100
# Cost Price = Sales - Profit

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


# Question B
# Clemong has a promotional plan in Albuquerque using the MLM method.
# Therefore, Clemong needs a list of customer names on the 2017
# transaction in Albuquerque.

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


# Question C
# TokoShisop focuses on three customer segments, among others:
# Home Offices, Consumers, and Corporates. Clemong wants to increase sales
# in the customer segment that has the least sales.
# Therefore, Clemong needs a customer segment and the number of transactions
# with the least amount of transactions.

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

# Question D
# TokoShiSop divides the sales region into four parts:
# Central, East, South, and West.
# Manis wants to find the region  that has the least total profit
# and the total profit of that region

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
