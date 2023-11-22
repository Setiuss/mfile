APP=$(shell basename $(shell git remote get-url origin))
#REGISTRY=setius
REGISTRY=gitlab.com/setius1/k8s-k3s
VERSION=$(shell git describe --tags --abbrev=0)-$(shell git rev-parse --short HEAD)
#TARGETOS=linux		#Linux darwin Windows
#TARGETARCH=amd64	#arm64
format:
	gofmt -s -w ./

lint:
	golint

test:
	go test -v	

get:
	go get

linux:
	CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -v -o mfile

arm:
	CGO_ENABLED=0 GOOS=linux GOARCH=arm64 go build -v -o mfile

macOS:
	CGO_ENABLED=0 GOOS=darwin GOARCH=amd64 go build -v -o mfile

windows:
	CGO_ENABLED=0 GOOS=windows GOARCH=amd64 go build -v -o mfile

image:
	docker build . -t ${REGISTRY}/${APP}:${VERSION}-${TARGETARCH}
#	docker build .

push:
	docker push ${REGISTRY}/${APP}:${VERSION}-${TARGETARCH}
#	docker push gitlab.com/setius1/k8s-k3s

clean:
	rm -rf mfile