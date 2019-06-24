#! /bin/bash

url=$1

wget https://crt.sh/?q=%25.$url -q -O - | 
awk '{print $1}' | grep -i $url | 
sort -u > tmp.out
sed -i 's/<TD>//g' tmp.out
sed -i 's/<\/TD>//g' tmp.out
mv tmp.out results.txt
cat results.txt

read -p "Would you like to scan for ports 80/443?: " answer

case ${answer:0:1} in
		y|Y )
				websites=$(<./results.txt)
				for line in $websites; do
					echo "$line"
					nc -zv -w 1 $line 80 2>&1 | grep -i "open"
					nc -zv -w 1 $line 443 2>&1 | grep -i "open"
					echo -e "\n"
				done
		;;
		* )
				echo "bye"
		;;
esac
