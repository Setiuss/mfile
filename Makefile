APP=$(shell basename $(shell git remote get-url origin))
REGISTRY=setius
#VERSION=$(shell git describe --tags --abbrev=0)-$(shell git rev-parse --short HEAD)
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

linux:
	TARGETOS=linux		#Linux darwin Windows
	TARGETARCH=amd64	#arm64
	CGO_ENABLED=0 GOOS=${TARGETOS} GOARCH=${TARGETARCH} go build -ldflags "-X="quay.io/projectquay/golang:1.20

image:
#	docker build . -t ${REGISTRY}/${APP}:${VERSION}-${TARGETARCH}
	docker build .

push:
#	docker push ${REGISTRY}/${APP}:${VERSION}-${TARGETARCH}

clean:
	rm -rf kbot