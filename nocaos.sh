#!/bin/bash
while true
do
	con=`ss -nat | fgrep ':8080' | awk '{print $1}' | sort | uniq -c | grep ESTAB | awk '{print$1}'`

	if [ -z $con ]
	then
                echo `date | awk '{print$1,$2,$3,$4}'` - OK - Sem conexoes estabelecidas no momento >> lfrjb.log
                `sleep 15`
	else
	        if [ 100  -lt $con ]
	        then
        	        echo `date | awk '{print$1,$2,$3,$4}'` - ERRO - Restart com $con conexoes >> lfrjb.log
                	`systemctl restart jboss`
	                `sleep 300`
        	else
                	echo `date | awk '{print$1,$2,$3,$4}'` - OK - Existem $con conexoes no momento >> lfrjb.log
	                `sleep 15`
		fi
        fi
done
