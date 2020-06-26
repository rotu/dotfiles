export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/bin:/usr/local/bin:$PATH"
export PATH="$HOME/Library/Python/3.7/bin:$PATH"

up () {
	sudo --validate
	if (( $+commands[poetry] )); then
	  poetry self update
	fi
	if (( $+commands[pip-review] )); then
	  pip-review --auto
	fi
	if (( $+commands[brew] )); then
	  brew upgrade
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
		sudo snap refresh -ry
	fi
}

export PIPENV_VENV_IN_PROJECT=1
source $HOME/.poetry/env
alias py="python3"
alias np="python3 -i -c 'import numpy as np'"
alias sympy="python3 -i -c 'import rlcompleter; from sympy import init_session; init_session()'"

alias pi="ssh pi@raspberrypi.local"
alias ls="ls -A"

export PATH="/usr/local/sbin:$PATH"