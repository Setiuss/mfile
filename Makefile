APP=$(shell basename $(shell git remote get-url origin))
#REGISTRY=setius
REGISTRY=gcr.io/k8s-k3s-405618
#VERSION=$(shell git describe --tags --abbrev=0)-$(shell git rev-parse --short HEAD)
VERSION=v1.0.0-$(shell git rev-parse --short HEAD)
#linux darwin windows
TARGETOS=linux
#amd64 arm64
TARGETARCH=amd64

format:
	gofmt -s -w ./

lint:
	golint

test:
	go test -v	

get:
	go get

build:
	CGO_ENABLED=0 GOOS=${TARGETOS} GOARCH=${TARGETARCH} go build -v -o mfile -ldflags "-X="${REGISTRY}/${APP}/cmd.appVersion=${VERSION}-${TARGETOS}-${TARGETARCH}

linux:
	CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -v -o mfile -ldflags "-X="${REGISTRY}/${APP}/cmd.appVersion=${VERSION}-${TARGETOS}-${TARGETARCH}

arm:
	CGO_ENABLED=0 GOOS=linux GOARCH=arm64 go build -v -o mfile -ldflags "-X="${REGISTRY}/${APP}/cmd.appVersion=${VERSION}-${TARGETOS}-${TARGETARCH}

macos:
	CGO_ENABLED=0 GOOS=darwin GOARCH=amd64 go build -v -o mfile -ldflags "-X="${REGISTRY}/${APP}/cmd.appVersion=${VERSION}-${TARGETOS}-${TARGETARCH}

windows:
	CGO_ENABLED=0 GOOS=windows GOARCH=amd64 go build -v -o mfile -ldflags "-X="${REGISTRY}/${APP}/cmd.appVersion=${VERSION}-${TARGETOS}-${TARGETARCH}

image:
	docker build . -t ${REGISTRY}/${APP}:${VERSION}-${TARGETOS}-${TARGETARCH}


push:
	docker push ${REGISTRY}/${APP}:${VERSION}-${TARGETOS}-${TARGETARCH}

clean:
	rm -rf mfile

rmi:
	docker rmi ${REGISTRY}/${APP}:${VERSION}-${TARGETOS}-${TARGETARCH} -f