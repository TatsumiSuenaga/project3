#!/bin/bash
#author Asad Iqbal

URL="http://thelantern.com/category/sports/basketball/"

curl -o basketball.html "$URL"

sed -n 's/.*href="\([^"]*\).*/\1/p' basketball.html > links.txt

grep -A 0 "womens-basketball" links.txt | uniq
