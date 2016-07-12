############################################################
# Dockerfile to run an OrientDB (Graph) Container
############################################################
FROM java:openjdk-8-jdk-alpine

MAINTAINER OrientDB LTD (info@orientdb.com)

FROM java:8-jdk

MAINTAINER OrientDB LTD (info@orientdb.com)

ENV ORIENTDB_VERSION 2.2.4
ENV ORIENTDB_DOWNLOAD_MD5 cfaf1e8e45bef79bdad4d9f6be3b9475
ENV ORIENTDB_DOWNLOAD_SHA1 b1de3f37187b7e2ef5309f171457ec7e35f25c00

#download distribution tar, untar and delete databases
RUN mkdir /orientdb && \
  wget  "http://central.maven.org/maven2/com/orientechnologies/orientdb-community/$ORIENTDB_VERSION/orientdb-community-$ORIENTDB_VERSION.tar.gz" \
  && echo "$ORIENTDB_DOWNLOAD_MD5 *orientdb-community-$ORIENTDB_VERSION.tar.gz" | md5sum -c - \
  && echo "$ORIENTDB_DOWNLOAD_SHA1 *orientdb-community-$ORIENTDB_VERSION.tar.gz" | sha1sum -c - \
  && tar -xvzf orientdb-community-$ORIENTDB_VERSION.tar.gz -C /orientdb --strip-components=1\
  && rm orientdb-community-$ORIENTDB_VERSION.tar.gz \
  && rm -rf /orientdb/databases/*

ENV PATH /orientdb/bin:$PATH

VOLUME ["/orientdb/backup"]

WORKDIR /orientdb

#OrientDb binary
EXPOSE 2424

EXPOSE 2434

#OrientDb http
EXPOSE 2480

# Default command start the server
CMD ["dserver.sh"]
