############################################################
# Dockerfile to run an OrientDB (Graph) Container
############################################################
FROM orientdb:2.2.4

EXPOSE 2434

# Default command start the server
CMD ["dserver.sh"]
