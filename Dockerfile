FROM alpine:3.5
RUN apk update && apk add --no-cache --virtual .build-deps ca-certificates curl unzip bash tor 

#RUN apk update && apk add --no-cache git bash curl


ENV UUID=5c25aa6b-9a78-47b6-9dd0-394855a99b3a
ENV PORT=8888

ADD configure.sh /configure.sh
RUN chmod +x /configure.sh
#RUN bash /configure.sh

CMD /configure.sh

#RUN echo "good lucky ,All cmd done !"
