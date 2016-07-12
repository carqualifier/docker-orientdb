############################################################
# Dockerfile to run an OrientDB (Graph) Container
############################################################
FROM orientdb:2.1.19

EXPOSE 2434

# Default command start the server
CMD ["dserver.sh"]
