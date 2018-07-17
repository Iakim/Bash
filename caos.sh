#!/bin/bash
while true
do
	con=`ss -nat | fgrep ':8080' | awk '{print $1}' | sort | uniq -c | grep ESTAB | awk '{print$1}'`
        if [ 50 -lt $con ]
        then
                echo `date | awk '{print$1,$2,$3,$4}'` - Restart - qtd $con >> lfrjb.log
                `systemctl restart jboss`
                `sleep 300`
        else
                echo `date | awk '{print$1,$2,$3,$4}'` - OK - qtd $con >> lfrjb.log
                `sleep 15`
        fi
done
