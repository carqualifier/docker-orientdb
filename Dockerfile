############################################################
# Dockerfile to run an OrientDB (Graph) Container
############################################################
FROM orientdb:2.0.18

EXPOSE 2434

RUN apt-get update -y \
  && apt-get install monit -y \
  && mkdir -p /var/monit/ \
  && chmod 0700 /etc/monit/monitrc \
  && apt-get purge -y --auto-remove

ADD orient_service.sh /orientdb/orient_service.sh

COPY monitrc /etc/monit/
RUN chmod 0700 /etc/monit/monitrc \
    && chmod +x /orientdb/orient_service.sh \
    && mkdir -p /orientdb/process/status \
    && touch /orientdb/process/status/ready

# Default command start the server
CMD ["/usr/bin/monit", "-I"]
