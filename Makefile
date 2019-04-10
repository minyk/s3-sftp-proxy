PWD := `pwd`

default: build

build: clean linux darwin windows

clean:
	rm -rf ./build

linux:
	docker run --rm -e "GOOS=linux" -e "GOARCH=amd64" -v $(PWD):/usr/src/github.com/minyk/dcos-maintenance -w /usr/src/github.com/minyk/dcos-maintenance golang:1.12 go build -ldflags="-s -w ${GO_LDFLAGS}" -v -o build/s3-sftp-proxy-linux

darwin:
	docker run --rm -e "GOOS=darwin" -e "GOARCH=amd64" -v $(PWD):/usr/src/github.com/minyk/dcos-maintenance -w /usr/src/github.com/minyk/dcos-maintenance golang:1.12 go build -ldflags="-s -w ${GO_LDFLAGS}" -v -o build/s3-sftp-proxy-darwin

windows:
	docker run --rm -e "GOOS=windows" -e "GOARCH=amd64" -v $(PWD):/usr/src/github.com/minyk/dcos-maintenance -w /usr/src/github.com/minyk/dcos-maintenance golang:1.12 go build -ldflags="-s -w ${GO_LDFLAGS}" -v -o build/s3-sftp-proxy-windows.exe