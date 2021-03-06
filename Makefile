# XXX no versioning of the docker image
IMAGE_NAME=planitar/logspout

ifneq ($(NOCACHE),)
  NOCACHEFLAG=--no-cache
endif

.PHONY: build push clean test

build: bin/logspout
	docker build ${NOCACHEFLAG} -t ${IMAGE_NAME} .

push:
ifneq (${IMAGE_TAG},)
	docker tag ${IMAGE_NAME} ${IMAGE_NAME}:${IMAGE_TAG}
	docker push ${IMAGE_NAME}:${IMAGE_TAG}
else
	docker push ${IMAGE_NAME}
endif

clean:
	docker rmi -f ${IMAGE_NAME} || true
	rm -rf ./bin

test:

bin/logspout:
	mkdir -p bin
	docker run --rm -v `pwd`/bin:/out planitar/dev-go /bin/bash -lc ' \
	  go get "github.com/PlanitarInc/logspout" && \
	  cp $$GOPATH/bin/logspout /out \
	'
