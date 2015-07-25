hiveserver2=''
echo
echo -e "\033[0;33m Getting all Beeline functions"
beeline -u $hiveserver2  -n $USER -e "show functions;" > beeline_functions.txt
echo
echo -e "\033[0;34m done"
echo "$(tail -n +22 beeline_functions.txt)" > beeline_functions.txt
sed -i -e 's/|//g' beeline_functions.txt
sed -i -e 's/tab_name//g' beeline_functions.txt
sed -i -e 's/-//g' beeline_functions.txt
sed -i -e 's/+//g' beeline_functions.txt
sed -i -e 's/~//g' beeline_functions.txt
sed -i -e '/^ *$/d' beeline_functions.txt
cat beeline_functions.txt | while read line 
do 
	echo
	echo -e "\033[0;36m reading functions"
	beeline -u $hiveserver2  -n $USER -e "describe function extended $line;" >> beeline_functions.txt
	echo
	echo -e "\033[0;33m Getting description for $line"
done
echo
echo "making file more human readable"
sed -i -e 's/tab_name/Function/g' beeline_functions.txt
echo
echo -e "\033[5;31m Finito!"
echo 
echo "You can find your beeline function descriptions in" 
echo | pwd 
echo "beeline_functions.txt"