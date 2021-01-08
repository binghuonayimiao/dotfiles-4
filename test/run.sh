#!/usr/bin/env bash

docker build -t dotfiles:env .

docker run --rm -ti dotfiles:env /bin/zsh
