FROM docker.io/centos:latest

RUN yum -y update
RUN yum -y install tigervnc-server
RUN yum -y groupinstall kde

RUN yum -y install firefox
RUN yum -y install ibus-kkc vlgothic-*

RUN yum -y install wget
RUN wget ftp://ftp.pbone.net/mirror/ftp5.gwdg.de/pub/opensuse/repositories/home:/Kenzy:/modified:/C7/CentOS_7/x86_64/unrar-5.0.12-2.1.x86_64.rpm
RUN rpm -ivh unrar-5.0.12-2.1.x86_64.rpm

#RUN yum -y install 

ENV LANG ja_JP.UTF-8

RUN mkdir -p /root/.vnc
RUN echo vncvnc | vncpasswd -f >> /root/.vnc/passwd
RUN chmod 600 /root/.vnc/passwd

#CMD /usr/bin/vncserver :1 && tail -f /root/.vnc/*:1.log

EXPOSE 5901

COPY vnc.sh /root/
CMD ["/root/vnc.sh"]
