#!/bin/bash


#Check for internet connection and if fails send alert via email
#You can put this to be executed in a crontab for automated execution or an alias for manual checking


# Definir variables
host="google.com"
LOGFILE="$HOME/network-connection.log"
timestamp=$(date "+%Y-%m-%d %H:%M:%S")

# Realizar el ping
ping -c 4 $host > /dev/null

# Comprobar el resultado del ping
if [ $? -ne 0 ]; then
    # Si el ping falla, escribir en el archivo de log y enviar el correo
    echo "$timestamp - Ping to $host failed!" >> $LOGFILE
    echo "Aditional details stored in $LOGFILE. Please, review this file for more information." | mail -s "Network connection Alert" user@example.com
else
    # Si el ping es exitoso, escribir en el archivo de log
    echo "$timestamp - Ping to $host successful." >> $LOGFILE
fi