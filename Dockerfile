FROM quartus-base:latest

RUN apt-get update && \
    apt-get -y install git expect emacs24-nox libtcmalloc-minimal4 locales wget

RUN echo "en_US.UTF-8 UTF-8" > /etc/locale.gen && \
    locale-gen en_US.UTF-8 && \
    /usr/sbin/update-locale LANG=en_US.UTF-8

RUN mkdir -p /quartus && cd /quartus \
    && wget http://download.altera.com/akdlm/software/acdsinst/18.1std/625/ib_tar/Quartus-lite-18.1.0.625-linux.tar \
    && tar xf Quartus-lite-18.1.0.625-linux.tar \
    && ./setup.sh --mode unattended --accept_eula 1 --installdir /opt/intelFPGA --disable-components quartus_help,quartus_update,modelsim_ase,modelsim_ae,arria_lite \
    && rm -rf /quartus \
