FROM ubuntu:26.04
WORKDIR /var/www
COPY resource_monitoring.sh /usr/local/bin/resource_monitoring.sh
RUN chmod +x /usr/local/bin/resource_monitoring.sh
CMD ["/usr/local/bin/resource_monitoring.sh"]
