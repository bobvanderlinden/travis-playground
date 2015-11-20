FROM armv7/armhf-debian
MAINTAINER Bob van der Linden <bobvanderlinden@gmail.com>

COPY qemu-arm-static /usr/bin/qemu-arm-static
COPY qemu-armeb-static /usr/bin/qemu-armeb-static
COPY machinekit /usr/src/


RUN apt-key adv --keyserver hkp://keys.gnupg.net --recv-key 73571BB9 && \
    sh -c 'echo "deb http://deb.dovetail-automata.com wheezy main" \
        > /etc/apt/sources.list.d/machinekit.list' && \
    sh -c 'echo "deb http://http.debian.net/debian wheezy-backports main" \
        >> /etc/apt/sources.list' && \
    apt-get update && \
    apt-get install -y --no-install-recommends \
        git \
        devscripts \
        fakeroot \
        equivs \
        lsb-release && \
    apt-get install -y -t wheezy-backports cython

WORKDIR /usr/src/machinekit
RUN ./debian/configure -prx && \
    yes | mk-build-deps -i -r && \
    debuild -eDEB_BUILD_OPTIONS="parallel=4" -us -uc -b -j4