FROM python:3.6
LABEL maintainer "M Matos <marcomatos@google.com>"

    RUN export PATH="$PATH:~/.local/bin"
    RUN apt update && apt install python-dev libusb-1.0-0-dev libudev-dev -y
    RUN pip3 install --upgrade setuptools
	RUN pip3 install --user Cython hidapi
	RUN pip3 install --user trezor_agent

    WORKDIR $HOME
    # ENTRYPOINT  ['.local/bin/trezor-agent']