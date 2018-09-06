FROM alpine
RUN apk add --update --no-cache alpine-sdk bash python curl pcre-dev zlib-dev
WORKDIR /root
RUN git clone https://github.com/edenhill/librdkafka.git
WORKDIR /root/librdkafka
RUN /root/librdkafka/configure
RUN make
RUN make install 
WORKDIR /root
RUN wget http://nginx.org/download/nginx-1.14.0.tar.gz
RUN tar -zxvf nginx-1.14.0.tar.gz
RUN git clone https://github.com/brg-liuwei/ngx_kafka_module.git
WORKDIR /root/nginx-1.14.0
RUN /root/nginx-1.14.0/configure --add-module=../ngx_kafka_module
RUN make
RUN sudo make install 
CMD /usr/local/nginx/sbin/nginx -g 'daemon off;'
#&& apk add nginx
#For golang applications RUN mkdir /lib64 && ln -s /lib/libc.musl-x86_64.so.1 /lib64/ld-linux-x86-64.so.2
#RUN sudo mkdir /run/nginx
EXPOSE 80
#CMD nginx -g 'daemon off;'
#ENTRYPOINT ["/bin/bash"]

