FROM ubuntu:26.04
RUN apt-get update && apt-get install -y --no-install-recommends python3 \ 
    && rm -rf /var/lib/apt/lists/*
WORKDIR /var/www
COPY resource_monitoring.sh /usr/local/bin/resource_monitoring.sh
RUN chmod +x /usr/local/bin/resource_monitoring.sh
CMD ["/bin/bash", "-c", "/usr/local/bin/resource_monitoring.sh & exec python3 -m http.server 8080"]
