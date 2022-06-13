#! /bin/bash

rm -f reporte.txt

echo "-------------- REPORTE -------------" >> reporte.txt

#Reportar envio de informacion de Error d servicio

#systemctl status ssh | grep active

apache=0

echo "------------ Apache ---------" >> reporte.txt

if systemctl status apache2 | grep failed ; then
	systemctl status apache2 >> reporte.txt
	apache=1
fi

echo "--------------- FIN REPORTE -----------" >> reporte.txt

if [ $apache == 1 ]; then
	cat ~/reporte.txt | mail -s "Reporte de Servicio APACHE" brayanpablo@outlook.com	
#	cat ~/reporte.txt
fi

#Antes de copiar la linea en el cron ejecutar crontab -e y luego copiar 5 * * * * "la direccion donde estara el archivo"/script2.sh
#5 * * * * "La direccion del archivo"/script2.sh >> crontab -e
