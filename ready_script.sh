#!/bin/bash
c=1
while [ $c -le 1000000 ]
do
	echo "xxxxxxxxxxxxxxxxxxxxxxxxxx Ready-Script <TK> xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
	echo "----------------------PTT---region--core-----------------"
	 snmpwalk <server-core> <MIB>
	 snmpwalk <server-region> <MIB>
sleep 3;
	echo "------------------xxxTIMESTAMPALGORITHM value -------------------------"
        ssh -o StrictHostKeyChecking=no -l qchat <server-region> "snmpwalk localhost xxxtimestamp"
sleep 3;
	echo "------------------xxx AUTH ENABLED ?? status -------------------------"
        ssh -o StrictHostKeyChecking=no -l qchat <server-region> "snmpwalk localhost xxxauth"
sleep 3;
	echo "------------------ALG xxx AUTH LEVEL -------------------------"
        ssh -o StrictHostKeyChecking=no -l qchat <server-region> "snmpwalk localhost  algxxxauth"
sleep 3;
	echo "------------------xFE-AAA status -------------------------"
	ssh -o StrictHostKeyChecking=no -l qchat <server-core> "ps -ef |grep -i xFE"
sleep 3;
	echo "------------------Deployment Mode WEB-SERVER-FE---------------------"
	snmpwalk  -u <User Name> -a MD5 -A "Auth Password" <server-region>:port deployment
sleep 3;
	 echo "------------------Radius status---------------------"
       # ssh -o StrictHostKeyChecking=no -l qchat <server-core> "sudo /etc/init.d/radiusd status"
	sudo /etc/init.d/radiusd status
sleep 3;

          echo "------------------Radius Server Mode---------------------"
	#ssh -o StrictHostKeyChecking=no -l qchat <server-core> "sudo cat /etc/raddb/xxxx.conf | grep -i convert"
	 sudo cat  /etc/raddb/xxxx.conf | grep -i convert
sleep 3;

	echo "--------------------5.2 PTX-----region--------------------"
	snmpwalk  -u <User Name> -a MD5 -A "Auth Password" <server-region>:port <MIB>
sleep 3;
	echo "--------------------5.2 PTX------core----------------------"
	snmpwalk  -u <User Name> -a MD5 -A "Auth Password" <server-core>:port <MIB>
sleep 3;
	echo "-------------------- QCDB---------------------------------"
	snmpwalk <user-db> <MIB>
        snmpwalk  -u <User Name> -a MD5 -A "Auth Password" <user-db>:port <MIB>

	echo "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"

	echo "xxxxxxxxxxxxx Checking Disk space Usage >CORE<  xxxxxxxxxxxxxxxxxxxxxxxxxxxx"

ssh -o StrictHostKeyChecking=no -l qchat <server-core> "df -kh"
	echo "xxxxxxxxxxxxx Checking Disk space Usage >REGION< xxxxxxxxxxxxxxxxxxxxxxxxxxx"
#sleep 3;
ssh -o StrictHostKeyChecking=no -l qchat <server-region> "df -kh"
	echo "xxxxxxxxxxxxx Checking Disk space Usage >UGDB<  xxxxxxxxxxxxxxxxxxxxxxxxxxxx"
#sleep 3;
ssh -o StrictHostKeyChecking=no -l qchat <user-db> "df -kh"
	echo "xxxxxxxxxxxxxx Checking Disk space Usage >HADOOP< xxxxxxxxxxxxxxxxxxxxxxxxxxx"
#sleep 3;
ssh -o StrictHostKeyChecking=no -l qchat <hadoop> "df -kh"
	echo "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
#sleep 3;


echo "xxxxxxxxxxxxxxxxxxxxxxxxx checking HIGH loglevels xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
#sleep 3;
	echo "--------------------5.2 PTX-----region---------------------"
	snmpwalk <server-region> <loglevelMIB> | grep -i '4\|5\|6'
#sleep 3;
	snmpwalk  -u <User Name> -a MD5 -A "Auth Password" <server-region>:port <loglevelMIB> | grep -i '4\|5\|6'
#sleep 3;
	echo "--------------------5.2 PTX------core----------------------"
	snmpwalk <server-core>  <loglevelMIB> | grep -i '4\|5\|6'
#sleep 3;	
	snmpwalk  -u <User Name> -a MD5 -A "Auth Password" <server-core>:port <loglevelMIB> | grep -i '4\|5\|6'
	echo "-----------------------------------------------------------"
#sleep 3;
	echo "--------------------- QCDB--------------------------------"
	snmpwalk <user-db> <loglevelMIB> | grep -i '4\|5\|6'
#sleep 3;
   	 snmpwalk  -u <User Name> -a MD5 -A "Auth Password" <user-db>:port <loglevelMIB> | grep  -i '4\|5\|6'
sleep 3;
	echo "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
	(( c++ ))
done

