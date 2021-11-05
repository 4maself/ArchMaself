#!/usr/bin/env bash
#-------------------------------------------------------------------------
#░█████╗░██████╗░░█████╗░██╗░░██╗███╗░░░███╗░█████╗░░██████╗███████╗██╗░░░░░███████╗
#██╔══██╗██╔══██╗██╔══██╗██║░░██║████╗░████║██╔══██╗██╔════╝██╔════╝██║░░░░░██╔════╝
#███████║██████╔╝██║░░╚═╝███████║██╔████╔██║███████║╚█████╗░█████╗░░██║░░░░░█████╗░░
#██╔══██║██╔══██╗██║░░██╗██╔══██║██║╚██╔╝██║██╔══██║░╚═══██╗██╔══╝░░██║░░░░░██╔══╝░░
#██║░░██║██║░░██║╚█████╔╝██║░░██║██║░╚═╝░██║██║░░██║██████╔╝███████╗███████╗██║░░░░░
#╚═╝░░╚═╝╚═╝░░╚═╝░╚════╝░╚═╝░░╚═╝╚═╝░░░░░╚═╝╚═╝░░╚═╝╚═════╝░╚══════╝╚══════╝╚═╝░░░░░
#-------------------------------------------------------------------------

echo -e "\nINSTALLING AUR SOFTWARE\n"
# You can solve users running this script as root with this and then doing the same for the next for statement. However I will leave this up to you.

echo "CLONING: YAY"
cd ~
git clone "https://aur.archlinux.org/yay.git"
cd ${HOME}/yay
makepkg -si --noconfirm
cd ~

PKGS=(
'autojump'
'awesome-terminal-fonts'
'firefox'
'chromium'
'dxvk-bin' # DXVK DirectX to Vulcan
'noto-fonts'
'noto-fonts-extra'
'noto-fonts-sc'
'noto-fonts-emoji'
'papirus-icon-theme'
'plasma-pa'
'ocs-url' # install packages from websites
'ttf-roboto'
'android-tools'
'arduino'
'arduino-avr-core'
'arduino-builder'
'arduino-ctags'
'sublime-text-4'
'spotify'
'nextcloud-client'
'electron'
'discord_arch_electron'
'docker'
'element-desktop'
'ffmpeg'
'ffmpeg-compat-57'
'galculator'
'signal-desktop'
'evolution'
'nemo'
'nemo-fileroller'
'nemo-image-converter'
'nemo-preview'
'nemo-qt-components'
'nemo-share'
'obs-studio'
'update-grub'
'virtio-win'
'vlc'
'wireguard-tools'
'kmywallet'
'sweet-kde-git'
'sweet-kde-theme-mars-git'
'sweet-kde-theme-nova-git'
)

for PKG in "${PKGS[@]}"; do
    yay -S --noconfirm $PKG
done

export PATH=$PATH:~/.local/bin
echo 'Setting personalizations'
cp $HOME/ArchMaself/home/* $HOME/
cp $HOME/ArchMaself/home/.bashrc $HOME/.bashrc
cp -r $HOME/ArchMaself/dotfiles/* $HOME/.config/
# This will override locale. Clearning this for /etc/locale.conf to use powerline (see 3-post-setup.sh)
rm $HOME/.config/plasma-localerc

pip install konsave
konsave -i $HOME/ArchMaself/kde.knsv
sleep 1
konsave -a kde

echo -e "\nDone!\n"
exit
