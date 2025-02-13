FROM ubuntu

MAINTAINER james

RUN apt-get update

RUN apt-get install -y vim wget dialog net-tools

RUN apt-get install -y nginx

RUN rm -v /etc/nginx/nginx.conf

ADD nginx.conf /etc/nginx/

RUN mkdir /etc/nginx/logs

ADD index.html /www/data/

RUN echo "daemon off;" >> /etc/nginx/nginx.conf

COPY runner.sh /runner.sh
RUN chmod +x /runner.sh

EXPOSE 80

ENTRYPOINT ["/runner.sh"]

CMD ["nginx"]
