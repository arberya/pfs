FROM golang

RUN apt-get update
RUN apt-get install -y btrfs-tools
RUN go get github.com/coreos/go-etcd/etcd
ADD . /go/src/pfs
RUN go install pfs/services/master
RUN go install pfs/services/replica
RUN go install pfs/services/router
RUN go install pfs/deploy

EXPOSE 80