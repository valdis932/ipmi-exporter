FROM golang:latest
RUN apt-get update
RUN apt-get install -y freeipmi dumb-init

WORKDIR /go

#RUN mkdir /etc/ipmi-exporter
# COPY ipmi.yml /etc/ipmi-exporter/
RUN go get github.com/soundcloud/ipmi_exporter
EXPOSE 9290

ENTRYPOINT ["dumb-init", "--"]
#CMD ["ipmi_exporter", "--config.file=/etc/ipmi-exporter/ipmi.yml" ]
CMD ["ipmi_exporter"]
