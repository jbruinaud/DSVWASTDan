# Example: docker build . -t dsvw && docker run -p 1234:65412 dsvw

FROM alpine:latest

USER tomcat

RUN apk --no-cache add git python3 py-lxml \
    && rm -rf /var/cache/apk/*

USER dsvw

WORKDIR /
RUN git clone https://github.com/stamparm/DSVW
RUN sed -i 's/127.0.0.1/0.0.0.0/g' /DSVW/dsvw.py

EXPOSE 65412

CMD ["python3", "/DSVW/dsvw.py"]
