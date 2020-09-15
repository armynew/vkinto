FROM alpine
RUN apk update && apk add --no-cache --virtual .build-deps ca-certificates curl unzip bash tor 

#RUN apk update && apk add --no-cache git bash curl


#ENV UUID=5c25aa6b-9a78-47b6-9dd0-394855a99b3a
#ENV PORT=8888
ENV CONFIG=https://raw.githubusercontent.com/armynew/vkinto/master/config.json

#ADD configure.sh /configure.sh
#RUN chmod +x /configure.sh
#RUN bash /configure.sh

#FROM alpine
#CMD /configure.sh
#CMD /usr/local/bin/v2ray -config /usr/local/etc/v2ray/config.json
RUN mkdir /tmp/v2ray 
RUN	curl -L -H "Cache-Control: no-cache" -o /tmp/v2ray/v2ray.zip https://github.com/v2fly/v2ray-core/releases/latest/download/v2ray-linux-64.zip
RUN	unzip /tmp/v2ray/v2ray.zip -d /tmp/v2ray
RUN	rm -rf /usr/local/bin/v2ray 
RUN	rm -rf /usr/local/bin/v2ctl 
RUN	rm -rf /usr/local/etc/v2ray 
RUN	install -m 755 /tmp/v2ray/v2ray /usr/local/bin/v2ray
RUN	install -m 755 /tmp/v2ray/v2ctl /usr/local/bin/v2ctl
RUN	rm -rf /tmp/v2ray
RUN	install -d /usr/local/etc/v2ray
CMD /usr/local/bin/v2ray -config $CONFIG  


#CMD nohup tor & \
#    /usr/local/bin/v2ray -config $CONFIG
