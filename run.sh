#!/usr/bin/env bash

#if [ -z "$1" ]; then
#echo -e '\033[0;31mScript requires one argument\033[0;0,'
#fi

#if [ -z "$USER" ]; then
#    export $USER=kali
#fi

docker run --rm -ti \
    -v "$HOME/.ssh:/home/$USER/.ssh" \
    --tty --interactive \
    . /bin/bash
