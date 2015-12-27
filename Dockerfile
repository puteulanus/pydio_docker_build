FROM quay.io/puteulanus/lnmp:centos6

# Install
ENV PYDIO_VERSION 6.2.1
WORKDIR /usr/www/default/
RUN wget -O pydio.tar.gz "http://jaist.dl.sourceforge.net/project/ajaxplorer/pydio/stable-channel/${PYDIO_VERSION}/pydio-core-${PYDIO_VERSION}.tar.gz"
RUN tar -zxf pydio.tar.gz
RUN mv pydio-core-${PYDIO_VERSION}/* public_html/
RUN rm -rf pydio-core-${PYDIO_VERSION}
RUN rm -f pydio.tar.gz
RUN chown -R www:www public_html
RUN chmod -R a+rw public_html

# Configure
RUN sed -i "s/output_buffering\s*=\s*4096/output_buffering = Off/g" /etc/php-fpm.conf
RUN sed -i "s#//define(\"AJXP_LOCALE\", \"en_EN.UTF-8\");
#define(\"AJXP_LOCALE\", \"en_us.UTF-8\");#" /usr/www/default/public_html/conf/bootstrap_conf.php
ADD pydio.conf /tmp/pydio.conf
RUN mv /tmp/pydio.conf /etc/nginx/conf.d/default.conf


# Expose Volumes
VOLUME /usr/www/default/public_html/data/files
VOLUME /usr/www/default/public_html/data/personal
RUN chown -R www:www /usr/www/default/public_html/data/files /usr/www/default/public_html/data/files
RUN chmod -R a+rw /usr/www/default/public_html/data/files /usr/www/default/public_html/data/files

# Expose Ports
EXPOSE 80
EXPOSE 443
