#!/bin/bash
#author Asad Iqbal, Tatsumi Suenaga, Sophy Chen

#Ask the user to choose a sport
echo "Which OSU sports team do you want to know more about?"
echo -e "Basketball [b] \nFootball [f]\nIce Hockey [i]\nTennis[t]\nExit [q]"
read sport 

#The following is the case for Basketball
if [ "$sport" == "b" ]; then
	URL="http://thelantern.com/category/sports/basketball/"
	curl -s -o sport.html "$URL"
	sed -n 's/.*<h2 class="post-title"><a href="\([^"]*\).*/\1/p' sport.html > links.txt
	echo -e "\nMen's Basketball [m]\nWomen's Basketball [w]\nBoth [b]"
	read gender 

	#start gender
	if [ "$gender" == "w" ];then #Womens Basketball
		echo -e "\nHere is some info on Women's Basketball\n"
		grep -A 0 "womens-basketball" links.txt | uniq
	elif [ "$gender" == "m" ]; then #Mens Basketball
		echo -e "\nHere is some info on Men's Basketball\n"
		grep -A 0 -- "-mens-basketball" links.txt | uniq
	elif [ "$gender" == "b" ]; then #Both Womens and Mens Basketball
		echo -e "\nHere is some info on Basketball\n"
		grep -A 0 -- "-mens-basketball" links.txt | uniq
		echo
		grep -A 0 "womens-basketball" links.txt | uniq
		echo
	else  
		echo "Invalid input! Exiting program. "
	fi
	#end gender
fi
#End Basketball

#The following is the case for Ice Hockey
if [ "$sport" == "i" ]; then
	URL="http://thelantern.com/category/sports/ice-hockey/"
	URL2="http://thelantern.com/category/sports/ice-hockey/page/2/"
	curl -s -o sport.html "$URL"
	curl -s -o sport.html "$URL2"
	sed -n 's/.*<h2 class="post-title"><a href="\([^"]*\).*/\1/p' sport.html > links.txt
	echo -e "\nMen's Ice Hockey [m]\nWomen's Ice Hockey [w]\nBoth [b]"
	read gender 

	#start gender
	if [ "$gender" == "w" ]; then #Womens Ice Hockey
		echo -e "\nHere is some info on Women's Ice Hockey\n"
		grep -A 0 "womens-hockey" links.txt | uniq
	elif [ "$gender" == "m" ]; then #Mens Ice Hockey
		echo -e "\nHere is some info on Men's Ice Hockey\n"
		grep -A 0 -- "-mens-hockey" links.txt | uniq
	elif [ "$gender" == "b" ]; then #Both Womens and Mens Ice Hockey
		echo -e "\nHere is some info on Ice Hockey\n"
		grep -A 0 -- "-mens-hockey" links.txt | uniq
		echo
		grep -A 0 "womens-hockey" links.txt | uniq
		echo
	else  
		echo "Invalid input! Exiting program."
	fi
	#end gender
fi
#End Ice Hockey

#The following is the case for Tennis
if [ "$sport" == "t" ]; then
	URL="http://thelantern.com/category/sports/tennis/"
	curl -s -o sport.html "$URL"
	sed -n 's/.*<h2 class="post-title"><a href="\([^"]*\).*/\1/p' sport.html > links.txt
	echo -e "\nMen's Tennis [m]\nWomen's Tennis [w]\nBoth [b]"
	read gender 

	#start gender
	if [ "$gender" == "w" ]; then #Womens Tennis
		echo -e "\nHere is some info on Women's Tennis\n"
		grep -A 0 "womens-tennis" links.txt | uniq
	elif [ "$gender" == "m" ]; then #Mens Tennis
		echo -e "\nHere is some info on Men's Tennis\n"
		grep -A 0 -- "-mens-tennis" links.txt | uniq
	elif [ "$gender" == "b" ]; then #Both Womens and Mens Tennis
		echo -e "\nHere is some info on Tennis\n"
		grep -A 0 -- "-mens-tennis" links.txt | uniq
		echo
		grep -A 0 "womens-tennis" links.txt | uniq
		echo
	else  
		echo "Invalid input! Exiting program."
	fi
	#end gender
fi
#End Tennis

#The following is the case for Football
if [ "$sport" == "f" ]; then
	URL="http://thelantern.com/category/sports/football/"
	curl -s -o sport.html "$URL"
	sed -n 's/.*<h2 class="post-title"><a href="\([^"]*\).*/\1/p' sport.html > links.txt 

	echo -e "\nHere is some info on Football\n"
	grep -A 0 "football" links.txt | uniq 
	echo
fi
#End Football

#Exiting the program
if [ "$sport" == "q" ]; then
	echo "Goodbye!"
	echo
elif [ "$sport" != "b" ] && [ "$sport" != "f" ] && [ "$sport" != "i" ] && [ "$sport" != "t" ]; then #Invalid character, including empty
	echo "Invalid input! Exiting program. "
	echo
fi
