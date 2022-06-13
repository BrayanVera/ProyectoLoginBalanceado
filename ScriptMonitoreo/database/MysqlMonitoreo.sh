#! /bin/bash

rm -f reporte.txt

echo "-------------- REPORTE -------------" >> reporte.txt

#Reportar envio de informacion de Error d servicio

#systemctl status ssh | grep active

sql=0

echo "------------ My SQL -----------" >> reporte.txt

if systemctl status mssql-server | grep failed ; then
	systemctl status mssql-server >> reporte.txt
	sql=1
fi

echo "--------------- FIN REPORTE -----------" >> reporte.txt

if [ $sql == 1 ]; then
	cat ~/reporte.txt | mail -s "Reporte de Servicio SQL " brayanpablo@outlook.com	
#	cat ~/reporte.txt
fi

#Antes de copiar la linea en el cron ejecutar crontab -e y luego copiar 5 * * * * "la direccion donde estara el archivo"/script2.sh
#5 * * * * "La direccion del archivo"/script2.sh >> crontab -e
