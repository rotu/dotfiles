#! /usr/bin/env zsh

export PATH="/usr/local/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.poetry/bin:$PATH"

# if (( $+commands[brew] ))
# then
# 	export LDFLAGS="-L$(brew --prefix)/opt/zlib/lib $LDFLAGS"
# 	export CPPFLAGS="-I$(brew --prefix)/opt/zlib/include $CPPFLAGS"
#   export LDFLAGS="-L$(brew --prefix)/opt/bzip2/lib"
#   export CPPFLAGS="-I$(brew --prefix)/opt/bzip2/include"
#   export LDFLAGS="-L$(brew --prefix)/opt/readline/lib"
#   export CPPFLAGS="-I$(brew --prefix)/opt/readline/include"
#   export PKG_CONFIG_PATH="/usr/local/opt/readline/lib/pkgconfig"
# fi

up () {
	sudo --validate
	if (( $+commands[poetry] )); then
		poetry self update
	fi
	if (( $+commands[pip-review] )); then
		pip-review --auto --user
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
		sudo snap refresh -ry
	fi
}
