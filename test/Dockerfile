
FROM archlinux:latest
LABEL Name=dotfiles Version=0.0.1

ARG USERNAME=ss-o
ARG PASSWORD=ss-o

ENV HOME /home/${USERNAME}

RUN pacman -Syu --noconfirm
RUN pacman -S base base-devel xdg-user-dirs git go wget ruby zsh python lsb-release nano grc openssh python-pygments --needed --noconfirm

RUN echo dotfiles > /etc/hostname
RUN echo 'en_GB.UTF-8 UTF-8' >> /etc/locale.gen
RUN locale-gen
RUN export LANG=C
RUN echo LANG=en_GB.UTF-8 > /etc/locale.conf

RUN useradd -m -r -G wheel -s /bin/bash ${USERNAME}
RUN echo "root:${PASSWORD}" | chpasswd
RUN echo "${USERNAME}:${PASSWORD}" | chpasswd
RUN echo "%wheel ALL=(ALL) NOPASSWD: ALL" | EDITOR='tee -a' visudo

ENV HOME /home/${USERNAME}
WORKDIR /home/${USERNAME}
USER ${USERNAME}
RUN LANG=C xdg-user-dirs-update --force &&\
    mkdir -p .ssh

USER ${USERNAME}
WORKDIR /tmp
RUN wget https://github.com/Jguer/yay/releases/download/v10.1.0/yay_10.1.0_x86_64.tar.gz &&\
    tar xzvf yay_10.1.0_x86_64.tar.gz
USER root
RUN cp /tmp/yay_10.1.0_x86_64/yay /usr/bin/yay
USER ${USERNAME}
WORKDIR /home/${USERNAME}
RUN git clone https://github.com/ss-o/dotfiles .dotfiles && cd .dotfiles &&\
    ./install
