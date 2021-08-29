up () {
	sudo --validate
	if (( $+commands[poetry] )); then
		poetry self update
	fi
	if (( $+commands[python3] )); then
		python3 -m pip install --upgrade --user pip setuptools wheel
	fi
	if (( $+commands[pip-upgrade] )); then 
		# pip install pip-upgrade-tool
		pip-upgrade --novenv -y
	fi
	if (( $+commands[brew] )); then
		brew upgrade --greedy && brew autoremove && brew cleanup
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
