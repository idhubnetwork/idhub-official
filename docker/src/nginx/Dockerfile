FROM ubuntu:16.04
MAINTAINER wubm <wubm@cepave.com>

# Setting time zone
ADD ./files/Timezone_Taipei /etc/localtime

# Update and install package
RUN apt-get update -y \
    && apt-get install -y vim nginx

COPY docker-entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
CMD ["-production"]
