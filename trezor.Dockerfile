# This should run as follows: 
# docker run -tid --restart=always \
# --name trezor-agent -h trezor-agent \
# --privileged -v /dev/bus/usb:/dev/bus/usb \
# trezor-agent:<version> 
# where version could be trezor, keepkey or nano  


FROM python:3.6
LABEL maintainer "M Matos <marcomatos@google.com>"

    RUN apt update && apt install python-dev libusb-1.0-0-dev libudev-dev -y
    RUN pip3 install --upgrade setuptools
	RUN pip3 install --user Cython hidapi
	RUN pip3 install --user trezor_agent
