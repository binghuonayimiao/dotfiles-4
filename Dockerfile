
FROM archlinux:latest

ARG USERNAME=ss-o
ARG PASSWORD=pass

ENV HOME /home/${USERNAME}

RUN pacman -Syu --noconfirm
RUN pacman -S base base-devel xdg-user-dirs git go wget curl zsh ruby python --noconfirm

RUN echo dotfiles > /etc/hostname
RUN echo 'en_GB.UTF-8 UTF-8' >> /etc/locale.gen
RUN locale-gen
RUN export LANG=C
RUN echo LANG=en_GB.UTF-8 > /etc/locale.conf

RUN useradd -m -r -G wheel -s /bin/bash ${USERNAME}
RUN echo "root:${PASSWORD}" | chpasswd
RUN echo "${USERNAME}:${PASSWORD}" | chpasswd
RUN echo '%wheel ALL=(ALL) ALL' | EDITOR='tee -a' visudo

ENV HOME /home/${USERNAME}
WORKDIR /home/${USERNAME}
USER ${USERNAME}
RUN LANG=C xdg-user-dirs-update --force

USER ${USERNAME}
WORKDIR /tmp
RUN wget https://github.com/Jguer/yay/releases/download/v10.1.0/yay_10.1.0_x86_64.tar.gz &&\
    tar xzvf yay_10.1.0_x86_64.tar.gz
USER root
RUN cp /tmp/yay_10.1.0_x86_64/yay /usr/bin/yay
USER ${USERNAME}
WORKDIR /home/${USERNAME}
RUN git clone https://github.com/masasam/dotfiles .dotfiles && cd .dotfiles \
    ./install
