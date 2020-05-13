FROM debian:buster
MAINTAINER AutomationGeek

EXPOSE 80

# Update apt, install dependencies and cleanup.
#RUN add-apt-repository ppa:ondrej/php -y && \
RUN apt-get update && \
    apt-get install -qy git wget unzip apache2 php php-mysql php-mbstring libapache2-mod-php default-mysql-client locales && \ 
    apt-get clean

# Fetch Raspberry Pints from rtlindne
RUN cd /var/www && \
    git clone https://github.com/rtlindne/RaspberryPints.git -b master Pints && \
    chown -R www-data:www-data /var/www/Pints

COPY etc/ /etc/

CMD /etc/init.d/apache2 start && \ 
    tail -f /dev/null
