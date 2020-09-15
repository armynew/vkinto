FROM alpine:3.5
RUN apk update && apk add --no-cache --virtual .build-deps ca-certificates curl unzip bash

#RUN apk update && apk add --no-cache git bash curl




ADD configure.sh /configure.sh
RUN chmod +x /configure.sh
RUN bash /configure.sh
#CMD /configure.sh

