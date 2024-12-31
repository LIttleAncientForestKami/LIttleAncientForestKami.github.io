#!/bin/bash
####################################
# Instalator potrzebnych pakietów  #
# Tomasz @LAFK_pl Borek, GPLv3     #
# Wersja 1.0                       #
####################################

# zap snap --classic
# https://forum.snapcraft.io/t/zap-snap-needs-manual-review/7575/25

set -e
set -x

system_update() {
	sudo apt update -y
	sudo apt upgrade -y
	sudo apt autoremove -y
}

git_config() {
	git config --global init.defaultBranch master
	git config --global name "Tomasz Borek"
	git config --global email Tomasz.Borek@gmail.com
	git config --global pull.rebase true
}

sdkman() {
	curl -s "https://get.sdkman.io" | bash
	source "$HOME/.sdkman/bin/sdkman-init.sh"
	export sdkman_auto_answer=true
	sdk i java 19-amzn
	export sdkman_auto_answer=false
	sdk i java 17.0.5-zulu
	sdk i java 11.0.12-open
	sdk i maven
	sdk i mvnd
	sdk i mcs
	sdk i pomchecker
	sdk i visualvm
	sdk i jmeter
  sdk i jbake
	# J to switch versions: https://github.com/ldziedziul/j/
	curl -fLo ~/.local/bin/J.sh https://raw.githubusercontent.com/ldziedziul/j/master/j.sh
	echo "alias J=\". ~/.local/bin/J.sh\"" >> ~/.bash_aliases
}

asciidoctor() {
  sudo apt install asciidoctor asciidoctor-pdf
  sudo gem install asciidoctor-diagram
}

completions() {
  echo "Maven Bash completion"
  sudo wget https://raw.github.com/juven/maven-bash-completion/master/bash_completion.bash --output-document /etc/bash_completion.d/mvn
}

obs_studio() {
	sudo add-apt-repository ppa:obsproject/obs-studio
	sudo apt install obs-studio
}

vifm_icons() {
	# NerdFont: 
	mkdir -p ~/.local/share/fonts
	cd ~/.local/share/fonts && curl -fLo "IBM 3270 Nerd Font Complete.otf" https://github.com/ryanoasis/nerd-fonts/blob/master/patched-fonts/3270/Regular/complete/IBM%203270%20Nerd%20Font%20Complete.otf?raw=true
	cd ~/.local/share/fonts && curl -fLo "IBM 3270 Nerd Font Complete Mono.otf" https://github.com/ryanoasis/nerd-fonts/blob/master/patched-fonts/3270/Regular/complete/IBM%203270%20Nerd%20Font%20Complete%20Mono.otf?raw=true
	# ikony w vifm: https://github.com/cirala/vifm_devicons/blob/master/favicons.vifm
	curl -fLo vifm-ico https://gist.githubusercontent.com/LIttleAncientForestKami/62431ee8a8b5e7d76dc78b0cbc47edcb/raw/6e9b197f81d9daecd6680e809de228740c4f08af/vifm-icons 
	mv vifm-ico ~/.config/vifm/
	echo ". ~/.config/vifm/vifm-ico" >> ~/.config/vifm/vifmrc
}

drawio() {
  wget https://github.com/jgraph/drawio-desktop/releases/download/v24.1.0/drawio-amd64-24.1.0.deb
  sudo dpkg -i drawio-amd64-24.1.0.deb
}

PREREQS="vim-gtk3 etckeeper git"
FILE_PKG="tree mupdf unzip meld vifm dos2unix "
ARCHIVE_PKG="unar unzip zip "
FONTS_PKG="fonts-powerline fonts-font-awesome "
MEDIA_PKG="ffmpeg mupdf screenkey byzanz webp-pixbuf-loader" # screenkey nie działa z Waylandaem :(
SYS_PKG="inxi htop atop iotop sysstat procps pstree xclip xdotool flatpak gnome-software-plugin-flatpak "
NET_PKG="net-tools nmap curl wget weechat wireshark "			 # network
UTILS_PKG="moreutils shellcheck stress siege autojump bat podman toilet jq shellcheck "
SEC_PKG="pass wl-clipboard lynis rkhunter needrestart "			 # security (wl-clipboard per https://askubuntu.com/questions/1370796/pass-is-missing-wl-copy-after-upgrade-to-21-10)
# Maybe: traceroute kolourpaint fzf (file finder)
 
system_update

# Batcat -> Bat name
ln -s /usr/bin/batcat ~/.local/bin/bat

# Flatpak repo connect
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

sudo apt install $PREREQS
sudo apt install $ARCHIVE_PKG $FILE_PKG $FONTS_PKG $MEDIA_PKG $SYS_PKG $SEC_PKG $UTILS_PKG -y
echo Instalacja podman-compose
pip3 install podman-compose

# snaps
snap install vlc vidcutter chromium-browser signal-desktop languagetool gh-cli lefthook

# funkcje
system_update
git_config
sdkman
asciidoctor
obs_studio
vifm_icons
drawio
completions
