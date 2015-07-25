echo
echo -e "\033[0;33m Getting all Hive functions"
hive -e "show functions;" > hive_functions.txt
echo
echo -e "\033[0;34m done"
echo "$(tail -n +19 hive_functions.txt)" > hive_functions.txt
cat hive_functions.txt | while read line 
do 
	echo
	echo -e "\033[0;36m reading functions"
	hive -e "describe function extended $line;" -S >> hive_functions.txt
	echo
	echo -e "\033[0;33m Getting description for $line"
done
echo
echo "making file more human readable"
sed -i -e 's/tab_name/ \n function_name \n /g' hive_functions.txt
echo
echo -e "\033[5;31m Finito!"
echo 
echo "You can find your hive function descriptions in" 
echo | pwd 
echo "hive_functions.txt"