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
RUN chmod -R u+rw public_html

# Expose Volumes
VOLUME /usr/www/default/public_html/files
VOLUME /usr/www/default/public_html/personal

# Expose Ports
EXPOSE 80
EXPOSE 443
