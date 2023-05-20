FROM ubuntu:latest 
LABEL YT <youness.tabii@gmail.com> 
RUN apt-get update
RUN apt-get -y upgrade
RUN apt-get -y install apache2
RUN a2enmod rewrite
ENV APACHE_RUN_USER www-data
ENV APACHE_RUN_GROUP www-data
ENV APACHE_LOG_DIR /var/log/apache2
ENV APACHE_LOCK_DIR /var/lock/apache2
ENV APACHE_PID_FILE /var/run/apache2.pid
EXPOSE 80
ADD AdminLTE-3.2.0 /var/www/AdminLTE-3.2.0
ADD apache-config.conf /etc/apache2/sites-enabled/000-default.conf
CMD /usr/sbin/apache2ctl -D FOREGROUND