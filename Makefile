NAME := trezor-agent

PHONY: all select build run 

all: select build run

select: 
	@read -p "Enter your device brand- trezor, nano or keepkey: " device  
	@echo "$$device" 
build:
	cat "$$device".Dockerfile > Dockerfile && export device=$$device
	docker build -t $(NAME):$device .

run:
	docker run -tid --restart=always \
	--name trezor-agent -h trezor-agent \
	--privileged -v /dev/bus/usb:/dev/bus/usb \
	$(NAME):$$device
	