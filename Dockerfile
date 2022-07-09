FROM amd64/golang
LABEL author="Krushi Raj Tula <krushiraj123@gmail.com>"

RUN apt-get update
# RUN apt-get git -y
RUN git clone https://github.com/pocketbase/pocketbase.git
WORKDIR /go/pocketbase
RUN go build
COPY pb_data ./pb_data

EXPOSE 8090
CMD ["go", "run", "./examples/base/main.go", "serve", "--http", "0.0.0.0:8090"]
