#!/bin/bash

export PATH=$PATH:~/.local/bin
# cp -r $HOME/ArchTitus/dotfiles/* $HOME/.config/
pip install konsave
konsave -i $HOME/AchMaself/kde.knsv
sleep 1
konsave -a kde
