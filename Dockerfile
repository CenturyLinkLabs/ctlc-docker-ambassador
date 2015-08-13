FROM ubuntu:precise
MAINTAINER	lucas@rufy.com

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update -qq -y && \
    apt-get install -qq -y socat supervisor && \
    apt-get clean

ADD /run.sh /run.sh
RUN chmod 755 /*.sh

CMD ["/run.sh"]
