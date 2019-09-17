NAME := trezor-agent

PHONY: all  

all:  
	@read -p "Enter your device brand - trezor, nano or keepkey: " device && \
	cat "$$device".Dockerfile > Dockerfile && \
	docker rm -f $(NAME) || docker build -t $(NAME):$$device . && \
	docker run -tid --restart=always \
	--name trezor-agent -h trezor-agent \
	--privileged -v /dev/bus/usb:/dev/bus/usb \
	$(NAME):$$device
	