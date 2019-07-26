FROM centos:7
MAINTAINER wubm <wubm@cepave.com>

# Setting time zone
RUN cp /usr/share/zoneinfo/Asia/Taipei /etc/localtime

# Update and install package
RUN yum -y install mysql-server mysql-devel net-tools

RUN (cd /lib/systemd/system/sysinit.target.wants/; for i in *; do [ $i == systemd-tmpfiles-setup.service ] || rm -f $i; done); \
rm -f /lib/systemd/system/multi-user.target.wants/*;\
rm -f /etc/systemd/system/*.wants/*;\
rm -f /lib/systemd/system/local-fs.target.wants/*; \
rm -f /lib/systemd/system/sockets.target.wants/*udev*; \
rm -f /lib/systemd/system/sockets.target.wants/*initctl*; \
rm -f /lib/systemd/system/basic.target.wants/*;\
rm -f /lib/systemd/system/anaconda.target.wants/*;

COPY my.cnf /etc/my.cnf
COPY docker-entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]

VOLUME /var/lib/mysql

USER 27

EXPOSE 3306
CMD ["mysqld_safe", "--character-set-server=utf8", "--collation-server=utf8_unicode_ci"]
