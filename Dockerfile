FROM openjdk:8u111-jre-alpine

# This is really mostly the upstream container with a slight pathing change
MAINTAINER edwin@edwinavalos.com

# Copy the daemon and CLI into the same container
COPY halyard/halyard-web/build/install/halyard /opt/halyard
COPY halyard/halyard-cli/build/install/halyard-cli /opt/halyard-cli
RUN apk add --update bash && rm -rf /var/cache/apk/*

CMD ["/opt/halyard/bin/halyard"]