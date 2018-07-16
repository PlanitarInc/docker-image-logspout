FROM planitar/base

ADD bin/logspout /bin/

ENV DOCKER_HOST unix:///tmp/docker.sock
ENV ROUTESPATH /mnt/routes
VOLUME /mnt/routes

EXPOSE 8000

ENTRYPOINT ["/usr/bin/tini", "--", "/bin/logspout"]
CMD []
