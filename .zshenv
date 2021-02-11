#! /usr/bin/env zsh

path=(
	/usr/local/bin
	$HOME/.local/bin
	$HOME/.cargo/bin
	$HOME/.poetry/bin
	$path
	)
export PATH
export DOTNET_CLI_TELEMETRY_OPTOUT=1

up () {
	sudo --validate
	if (( $+commands[poetry] )); then
		poetry self update
	fi
	if (( $+commands[python3] )); then
		python3 -m pip install --upgrade --user pip setuptools wheel
		python3 -m pip install --upgrade --quiet --user --requirement =(python3 -m pip freeze --user --exclude-editable | sed 's/=.*//')
	fi
	if (( $+commands[brew] )); then
		brew upgrade --greedy
	fi
	if (( $+commands[rosdep] )); then
		rosdep update
	fi
	if (( $+commands[softwareupdate] )); then
		softwareupdate -i -a
	fi
	if (( $+commands[apt] )) && [[ "$OSTYPE" != "darwin"* ]]; then
		sudo apt update && sudo apt full-upgrade -y && sudo apt autoremove
	fi
	if (( $+commands[snap] )); then
		sudo snap refresh
	fi
}
