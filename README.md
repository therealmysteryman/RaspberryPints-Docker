# RaspberryPints-Docker

RaspberryPints Docker using rtlindne version ( https://github.com/rtlindne/RaspberryPints ), based on Debian Buster.

You need to have an instance of MySQL or MariaDB running that could be used by RPints. 

## Backup 

If you want to backup your connection, please backup those files : 
 - /var/www/Pints/includes/config.php
 - /var/www/Pints/admin/includes/conn.php.

If you want to backup the data from the MySQL DB there are scripts you can modify based off your need :
 - /var/www/Pints/maintenance_scripts
