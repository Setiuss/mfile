FROM образ quay.io/projectquay/golang:1.20
WORKDIR /
#COPY . .
#RUN make build

#FROM scratch
#WORKDIR /
#COPY --from=builder /go/src/app/kbot .
#COPY --from=alpine:latest /etc/ssl/certs/ca-certificates.crt /etc/ssl/certs/
#ENTRYPOINT [ "./kbot" ]
CMD [ "sh" ]