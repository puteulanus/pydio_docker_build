FROM quay.io/puteulanus/lnmp:centos6

# Install
ENV PYDIO_VERSION 6.2.1
WORKDIR /usr/www
RUN curl -o pydio.zip "http://jaist.dl.sourceforge.net/project/ajaxplorer/pydio/stable-channel/${PYDIO_VERSION}/pydio-core-${PYDIO_VERSION}.zip"
RUN unzip pydio.zip
RUN mv pydio-core-${PYDIO_VERSION}/* default/
RUN chown -R www:www default
RUN chmod -R u+rw default

# Expose Volumes
VOLUME /usr/www/default/files
VOLUME /usr/www/personal

# Expose Ports
EXPOSE 80
EXPOSE 443
