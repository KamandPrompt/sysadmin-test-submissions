FROM ubuntu:16.04

WORKDIR	/home

ADD . /home

RUN apt-get update | apt-get upgrade

EXPOSE 80

ENV NAME World

CMD ["sh", "testfile.sh"]

