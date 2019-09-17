# This should run as follows: 
# docker run -tid --restart=always \
# --name trezor-agent -h trezor-agent \
# --privileged -v /dev/bus/usb:/dev/bus/usb \
# trezor-agent:<version> 
# where version could be trezor, keepkey or nano  