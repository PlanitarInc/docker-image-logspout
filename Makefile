# XXX no versioning of the docker image
IMAGE_NAME=planitar/logspout

ifneq ($(NOCACHE),)
  NOCACHEFLAG=--no-cache
endif

.PHONY: build push clean test

build: bin/logspout
	docker build ${NOCACHEFLAG} -t ${IMAGE_NAME} .

push:
	docker push ${IMAGE_NAME}

clean:
	docker rmi -f ${IMAGE_NAME} || true
	rm -rf ./bin

test:

bin/logspout:
	mkdir -p bin
	docker run --rm -v `pwd`/bin:/out planitar/dev-go /bin/bash -lc ' \
	  go get "github.com/progrium/logspout" && \
	  cp $$GOPATH/bin/logspout /out \
	'
