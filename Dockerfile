# Use semiofficial image with Java installed 
# (https://github.com/dockerfile/java)
FROM java:7
# Download and unpack Elasticsearch into /usr/local
RUN curl -s https://download.elasticsearch.org/elasticsearch/elasticsearch/elasticsearch-1.4.2.tar.gz | tar -C /usr/local -xz
RUN ln -s /usr/local/elasticsearch-1.4.2 /usr/local/elasticsearch
# Make a directory to hold data (more about this later)
RUN mkdir -p /var/data/elasticsearch
# Install jq to make health checks easier to write
RUN apt-get update && \
    apt-get install jq && \
    rm -rf /var/lib/apt/lists/*
