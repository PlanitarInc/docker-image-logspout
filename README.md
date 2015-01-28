
Planitar's docker container for [logspout](https://github.com/progrium/logspout),
ligthweight tool for collecting logs of docker containers

### Run

```sh
docker run -v=/var/run/docker.sock:/tmp/docker.sock planitar/logspout
curl -H 'Accept: application/json' $(docker port `docker ps -lq` 8000)/logs
```

### Forward to syslog server

```sh
docker run -v=/var/run/docker.sock:/tmp/docker.sock \
  planitar/logspout syslog://<IP>:<PORT>/
```
