FROM shujie/archlinux:latest
MAINTAINER Shujie Zhang
RUN pacman -Syu --noconfirm
RUN pacman -S --noconfirm apache owncloud owncloud-app-bookmarks owncloud-app-calendar owncloud-app-contacts owncloud-app-documents owncloud-app-gallery
RUN pacman -S --noconfirm php-apache php-imap php-intl php-mcrypt php-apcu
RUN pacman -Scc --noconfirm
RUN sed -i 's/^;//g' /etc/php/conf.d/apcu.ini
RUN mkdir /run/httpd/
RUN chown -R http:http /usr/share/webapps
CMD apachectl start && tail -f /usr/share/webapps/owncloud/data/owncloud.log
