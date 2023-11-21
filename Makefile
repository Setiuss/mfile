APP=$(shell basename $(shell git remote get-url origin))
REGISTRY=setius
VERSION=$(shell git describe --tags --abbrev=0)-$(shell git rev-parse --short HEAD)
TARGETOS=linux		#Linux darwin Windows
TARGETARCH=amd64	#arm64
format:
	gofmt -s -w ./

lint:
	golint

test:
	go test -v	

get:
	go get

build:
#	CGO_ENABLED=0 GOOS=${TARGETOS} GOARCH=${shell dpkg --print-architecture} go build -v -o kbot -ldflags "-X="github.com/Setiuss/kbot/cmd.appVersion=${VERSION}
	CGO_ENABLED=0 GOOS=${TARGETOS} GOARCH=${TARGETARCH} go build -v -o kbot -ldflags "-X="github.com/Setiuss/kbot/cmd.appVersion=${VERSION}

image:
	docker build . -t ${REGISTRY}/${APP}:${VERSION}-${TARGETARCH}

push:
	docker push ${REGISTRY}/${APP}:${VERSION}-${TARGETARCH}

clean:
	rm -rf kbot