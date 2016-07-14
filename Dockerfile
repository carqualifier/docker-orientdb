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

VOLUME ["/orientdb/status"]  

COPY monitrc /etc/monit/
RUN chmod 0700 /etc/monit/monitrc \
    && mkdir -p /orientdb/status \
    && touch /orientdb/status/ready.status

# Default command start the server
CMD ["/usr/bin/monit", "-I"]
