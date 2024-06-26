# Makefile
.DEFAULT_GOAL := help

checkmark=\xE2\x9C\x94  # Unicode character representation
warning=\xE2\x9A\xA0  # Unicode character representation

define warn
	@tput bold
	@tput setaf 3
	@printf "${warning}${1}\n"
	@tput sgr0
endef

define log
	@tput bold
	@tput setaf 6
	@printf "${checkmark}${1}\n"
	@tput sgr0
endef

DISTRO := $(XDG_CURRENT_DESKTOP)

base-setup:
	./00-base.sh

yay-setup:
	mkdir -p $(HOME)/workspace/projects/repositories/yay
	git clone https://aur.archlinux.org/yay.git $(HOME)/workspace/projects/repositories/yay
	(cd $(HOME)/workspace/projects/repositories/yay && makepkg -si)

awesomewm-setup:
	./01-awesomewm.sh

.PHONY: qtile
qtile:
	@$(call warn, installing qtile)
	./01-qtile.sh
	@$(call warn, stow qtile)
	exec stow --restow --verbose --dir=$(HOME)/workspace --target=$(HOME) qtile
	@$(call log, qtile)

extra-setup:
	./02-extras.sh

development-setup: sdkman-setup python-setup
	./03-development.sh

.PHONY: stow-setup
stow-setup:
	@$(call warn, stow - arch neovim terminal)
	mkdir -p $(HOME)/.cache/zsh
	mkdir -p $(HOME)/.config/gtk-3.0
	exec stow --restow --verbose --dir=$(HOME)/workspace --target=$(HOME) arch
	exec stow --restow --verbose --dir=$(HOME)/workspace --target=$(HOME) neovim
	exec stow --restow --verbose --dir=$(HOME)/workspace --target=$(HOME) terminal
ifeq ($(DISTRO), awesomewm)
	@$(call warn, awesome)
	exec stow --restow --verbose --dir=$(HOME)/workspace --target=$(HOME) awesome
endif
ifeq ($(DISTRO), qtile)
	@$(call warn, qtile)
	exec stow --restow --verbose --dir=$(HOME)/workspace --target=$(HOME) qtile
endif
	@$(call log, stow)

zsh-setup:
	mkdir -p $(HOME)/.cache/zsh
	chsh -s $$(which zsh)
	sudo chsh -s $$(which zsh)
	@echo "Restart to enable zsh"

audio-setup:
	./04-audio.sh
	systemctl --user enable --now pipewire.socket
	systemctl --user enable --now pipewire-pulse.socket
	systemctl --user enable --now wireplumber.service
	sudo systemctl enable --now bluetooth.service

gaming-setup:
	./08-games.sh

productivity-setup:
	./06-productivity.sh

git-submodules-init:
	@echo "Requires ssh configured in github"
	git submodule init
	git submodule update

repository-setup:
	@echo "Requires ssh configured in github"
	$(HOME)/workspace/bin/cloneworkspace.py -s ./workspace.json -r

.PHONY: copy-gnome-files
copy-gnome-files:
	cp $(HOME)/workspace/installation/arch/extras/mimeapps.list $(HOME)/.config
	cp $(HOME)/workspace/installation/arch/extras/user-dirs.dirs $(HOME)/.config

logiops-setup:
	sudo pacman -S cmake libevdev libconfig pkgconf
	mkdir -p $(HOME)/workspace/projects/repositories/logiops
	git clone https://github.com/PixlOne/logiops.git $(HOME)/workspace/projects/repositories/logiops
	mkdir -p $(HOME)/workspace/projects/repositories/logiops/build
	(cd $(HOME)/workspace/projects/repositories/logiops/build && cmake .. && make)
	(cd $(HOME)/workspace/projects/repositories/logiops/build && sudo make install)
	sudo systemctl enable --now logid

k2-setup:
	@echo "https://github.com/adam-savard/keyboard-function-keys-linux"
	sudo cp $(HOME)/workspace/installation/arch/extras/keychron.service /etc/systemd/system/
	sudo systemctl enable --now keychron

login-manager-setup:
	@echo "Enable gdm"
	sudo systemctl enable gdm
	sudo systemctl start gdm

gnome-setup: stow-setup
	@echo "Gnome requires unique user"
	./01-gnome.sh

.PHONY: sdkman-setup
sdkman-setup:
	@$(call warn, sdkman)
	./03-sdkman.zsh
	@$(call log, sdkman)

.PHONY: python-setup
python-setup:
	@$(call warn, python)
	./03-python.sh
	@$(call log, python)
