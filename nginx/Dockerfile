FROM nginx

ADD etc/conf/nginx.conf /etc/nginx/
ADD etc/conf/symfony.conf /etc/nginx/conf.d/default.conf

RUN echo "upstream php-upstream { server php:9000; }" > /etc/nginx/conf.d/upstream.conf

CMD ["nginx"]

EXPOSE 80
EXPOSE 443
