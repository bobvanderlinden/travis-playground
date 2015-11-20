FROM armv7/armhf-debian
MAINTAINER Bob van der Linden <bobvanderlinden@gmail.com>

COPY qemu-arm-static /usr/local/bin/qemu-arm-static
COPY qemu-armeb-static /usr/local/bin/qemu-armeb-static
RUN /bin/echo It works!