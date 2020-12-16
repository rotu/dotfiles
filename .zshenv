#! /usr/bin/env zsh

export PATH="/usr/local/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.poetry/bin:$PATH"

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
		rosdep install --from /opt/ros/master/src -ry
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
	if (( $+commands[op] )); then
		sudo op update
	fi
}
