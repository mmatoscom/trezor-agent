# this should be run as follows: 
# docker run -tid --restart=always \
# --name trezor-agent -h trezor-agent \
# --privileged -v /dev/bus/usb:/dev/bus/usb \
# trezor:<version> 

FROM python:3.7.4
LABEL maintainer "M Matos <marcomatos@google.com>"

	RUN pip3 install Cython hidapi
	RUN pip3 install trezor_agent
