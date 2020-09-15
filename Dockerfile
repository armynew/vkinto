FROM alpine
RUN apk add --no-cache --virtual .build-deps ca-certificates curl unzip tor bash
ADD configure.sh /configure.sh
RUN chmod +x /configure.sh
RUN bash /configure.sh
