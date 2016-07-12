############################################################
# Dockerfile to run an OrientDB (Graph) Container
############################################################
FROM orientdb:2.0.18

EXPOSE 2434

# Default command start the server
CMD ["dserver.sh"]
