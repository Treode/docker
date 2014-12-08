USAGE="\
To build the image: make build\n\
To run the image: make run\n\
To remove the image before building again: make rm\n\
To run in a cluster, you may run it as:\n\
make CLUSTER=\"/root/run.sh -c0x1 -r'-hail 0x1=172.17.0.132:7070'\" run\n\
"

all:
	@echo $(USAGE)

rm:
	docker rmi treode/examples-movies:0.2.0

build:
	docker build --rm -t treode/examples-movies:0.2.0 .

run:
	docker run --rm -it -p 80:80 -p 7070:7070 -p 6278:6278 -p 9990:9990 treode/examples-movies:0.2.0 $(CLUSTER)
