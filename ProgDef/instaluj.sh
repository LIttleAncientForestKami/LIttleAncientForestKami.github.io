#!/bin/bash
####################################
# Instalator potrzebnych pakietów  #
# Tomasz @LAFK_pl Borek, GPLv3     #
####################################

set -e
set -x

system_update() {
	sudo apt update -y
	sudo apt upgrade -y
	sudo apt autoremove -y
}

git_config() {
	git config --global init.defaultBranch master
	git config --global name $1
	git config --global email $2
	git config --global pull.rebase true
}

sdkman() {
	curl -s "https://get.sdkman.io" | bash
	source "$HOME/.sdkman/bin/sdkman-init.sh"
	# TODO: domyślnie odpowie tak, także na pytanie o domyślną wersję Javy
	export sdkman_auto_answer=true
	sdk i java 19-amzn
	export sdkman_auto_answer=false
	#sdk i java 17.0.5-zulu
	#sdk i java 11.0.12-open
	sdk i maven
	sdk i pomchecker
	# J do przełączania wersji: https://github.com/ldziedziul/j/
  mkdir -p ~/.local/bin/
	curl -fLo ~/.local/bin/J.sh https://raw.githubusercontent.com/ldziedziul/j/master/j.sh
	echo "alias J=\". ~/.local/bin/J.sh\"" >> ~/.bash_aliases
}

asdf() {
	git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.11.0
	echo "# ASDF " >> ~/.bashrc
  echo ". $HOME/.asdf/asdf.sh" >> ~/.bashrc
	echo ". $HOME/.asdf/completions/asdf.bash" >> ~/.bashrc
	asdf plugin add nodejs https://github.com/asdf-vm/asdf-nodejs.git
  asdf install nodejs latest
	asdf global nodejs latest
	asdf global npm latest
	# TODO: wersje dopisać to ~/.asdf/.tool-versions dla node i dla npma?
}


aws-git-secrets() {
	git clone https://github.com/awslabs/git-secrets.git
	cd git-secrets
	make install
	cd ..
}

docker-scout() {
  curl -fsSL https://raw.githubusercontent.com/docker/scout-cli/main/install.sh -o install-scout.sh
  chmod +x install-scout.sh
  ./install-scout.sh
  docker scout version
  docker scout cves sonarqube
}

PACZKI="git zip unzip htop curl podman git-secret"
 
system_update
sudo apt install $PACZKI
echo "alias docker=podman" >> ~/.bash_aliases

git_config
sdkman
asdf

# python cookiecutter
pip install cookiecutter 
git clone https://github.com/audreyfeldroy/cookiecutter-pypackage.git

