NAME := trezor-agent

PHONY: all  

all:  
	@read -p "Enter your device brand - trezor, nano or keepkey: " device && \
	cat "$$device".Dockerfile > Dockerfile && \
	docker build --no-cache -t $(NAME):$$device . && \
	docker stop $(NAME)|| true && docker rm $(NAME) || true && \
	docker run -ti \
	--name trezor-agent -h trezor-agent \
	--privileged -v /dev/bus/usb:/dev/bus/usb \
	$(NAME):$$device
	