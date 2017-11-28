FROM openjdk:8u131-jre-alpine

# This is really mostly the upstream container with a slight pathing change
MAINTAINER edwin@edwinavalos.com

COPY halyard/halyard-web/build/install/halyard /opt/halyard
RUN apk add --update bash
ENV PATH /opt/halyard/bin:$PATH
    
CMD ["/opt/halyard/bin/halyard"]
