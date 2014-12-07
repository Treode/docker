all:
	@echo "\nTo build the image: make build\n\nTo run the image: make run\n\nTo remove the image before building again: make rm\n"

rm:
	docker rmi treode/treode-examples:movies-0.2.0

build:
	docker build --rm -t treode/treode-examples:movies-0.2.0 .

run:
	docker run --rm -it -p 80:80 -p 7070:7070 treode/treode-examples:movies-0.2.0 
