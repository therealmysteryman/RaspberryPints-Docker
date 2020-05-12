FROM debian:stretch
MAINTAINER Automation Geek

EXPOSE 80

# Update apt, install dependencies and cleanup.
#RUN add-apt-repository ppa:ondrej/php -y && \
RUN apt-get update && \
    apt-get install -qy git wget unzip apache2 php php-mysql php-mbstring libapache2-mod-php mariadb-server locales nano && \ 
    apt-get clean

# Set Localisation
RUN sed -i -e 's/# en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen && \
    dpkg-reconfigure --frontend=noninteractive locales && \
    update-locale LANG=en_US.UTF-8

ENV LANG en_US.UTF-8 

# Fetch Raspberry Pints from rtlindne
RUN cd /var/www && \
    git clone https://github.com/rtlindne/RaspberryPints.git -b master Pints && \
    chown -R www-data:www-data /var/www/Pints

VOLUME /var/www/Pints/data

COPY etc/ /etc/

#RUN chmod +x /etc/my_init.d/*
#RUN find /etc/service -name run -exec chmod +x {} \;

CMD /bin/bash
