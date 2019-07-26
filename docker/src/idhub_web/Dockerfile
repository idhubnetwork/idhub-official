FROM node:10.6.0
MAINTAINER don@idhub.network

# ENV VAR
ENV HOME=/root WORKDIR=/root/idhub

# Switch to /root
WORKDIR $HOME

# Prepare env
RUN mkdir -p $WORKDIR
COPY . $WORKDIR

WORKDIR $WORKDIR
# Install package
RUN cd $WORKDIR \
    && npm install -g express pm2 yarn \
    && yarn install \
    && yarn run build

COPY ./docker/src/idhub_web/docker-entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
CMD ["-p"]
