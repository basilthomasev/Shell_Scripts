 #!/bin/bash
 echo "--------------"
 echo "Lynis Audit Script"
 echo "Collecting some basic details "
 echo "---------------------------------------------------------------------    "
 echo "--------------"
 
 #code to input the machine tag/name
 cd Secwan/
 read -p "Enter the machine name/Tag :" name
 echo $name "Directory is created"
 mkdir $name && chmod 777 $name
 echo $name "Given permission"
 cd ./..
 echo "---------------------------------------------------------------------    "
 echo "--------------"

 echo "Continuing to phase2"
 # code to audit the system
 cd lynis-master/
 echo "Gathering ipaddress information"
 read -p "Enter the adapter name:  " adapter
 echo $adapter "is the apater"
 
 	ipaddress=`ifconfig ens33 2>/dev/null|awk '/inet addr:/ {print $2}'|sed 's/addr://'`

  
  echo "Your IP address is "$ipaddress 
 echo "---------------------------------------------------------------------    "
  echo "--------------"
  echo "Starting the System Audit"
 ./lynis audit system > $ipaddress.log
  echo "Saving and giving permission to log"
  chmod 777 $ipaddress.log
  cd ./..

 echo "---------------------------------------------------------------------    "
 echo "--------------"
 #move lynis log to Secwan Directory
 echo "Moving the file to New location"
 cp lynis-master/$ipaddress.log Secwan/Backup/$ipaddress.log
 mv lynis-master/$ipaddress.log Secwan/$name/
 echo "Shell is executed ......"
  echo "---------------------------------------------------------------------                     "

