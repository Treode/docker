FROM debian:wheezy
MAINTAINER manux@treode.com
RUN mkdir -p /var/lib/treode/lib
RUN mkdir -p /var/lib/treode/www
RUN mkdir -p /var/lib/treode/logs
RUN mkdir -p /var/lib/treode/db
RUN mkdir -p /var/lib/spark/

# Update Debian and install basic packages
RUN apt-get update
RUN apt-get install -y procps vim nginx curl wget unzip openjdk-7-jre-headless

ADD http://d3kbcqa49mib13.cloudfront.net/spark-1.1.1-bin-hadoop2.4.tgz  /var/tmp/
RUN tar -x --no-same-owner -C /var/lib/spark/ -z -f /var/tmp/spark-1.1.1-bin-hadoop2.4.tgz

ADD http://oss.treode.com/examples/movies/0.2.0-SNAPSHOT/movies-server-0.2.0-SNAPSHOT.jar /var/lib/treode/lib/movies-server-0.2.0.jar
ADD http://oss.treode.com/examples/movies/0.2.0-SNAPSHOT/movies-ui-0.2.0-SNAPSHOT.tgz /var/lib/treode/
RUN tar -x -C /var/lib/treode/www/ -f /var/lib/treode/movies-ui-0.2.0-SNAPSHOT.tgz 

COPY conf/nginx  /etc/nginx/sites-available/nginx
RUN rm /etc/nginx/sites-enabled/default
RUN ln -s /etc/nginx/sites-available/nginx /etc/nginx/sites-enabled/nginx

COPY conf/run.sh /root/run.sh
CMD /root/run.sh

