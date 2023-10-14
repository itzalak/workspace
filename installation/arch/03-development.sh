#!/bin/bash

set -e

PKGS=(
	# Neovim
	npm

	# JVM
	jre8-openjdk
	jre11-openjdk
	jre17-openjdk
	jre-openjdk
	jdk11-openjdk
	jdk17-openjdk
	jdk-openjdk
	kotlin
	ktlint
	gradle
	groovy

	# Lua
	lua
	luarocks
	stylua

	# Python
	python
	python-pip
	python-virtualenv
	python-pipenv
	python-pynvim
	python-setuptools
	python-black
	python-ruff
	python-pre-commit
	pip-tools

	# IDE
	intellij-idea-community-edition
	pycharm-community-edition
	visual-studio-code-bin

	# Docker
	docker
	docker-compose

	# Misc
	cargo
	jq
	yq
	slack-desktop
	zsa-wally
)

for PKG in "${PKGS[@]}"; do
	echo
	echo "INSTALLING PACKAGE: $PKG"
	yay -S "$PKG" --noconfirm --needed
done

echo
echo "Installation is done"
echo
