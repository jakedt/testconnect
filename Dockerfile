FROM lopter/raring-base 
MAINTAINER Jacob Moshenko "jake@devtable.com"

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update
RUN apt-get install -y openjdk-7-jre

ADD https://download.elasticsearch.org/logstash/logstash/logstash-1.3.3-flatjar.jar logstash.jar

ADD run.sh run.sh
ADD mustache.sh mustache.sh
ADD conf/ conf/

VOLUME ["/mnt/logs"]

ENTRYPOINT ["./run.sh"]
CMD ["indexer.conf"]
