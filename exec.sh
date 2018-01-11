#!/bin/sh

echo "exec...."

for i in `ls script`; do
	echo script/$i
	sh script/$i
        sleep 5;
done
echo "exec....done"


echo "insert...."

for i in `ls sql`; do
	echo sql/$i
	mysql -uroot coin < sql/$i
	sleep 5;
done 
echo "insert....done"
