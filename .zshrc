#!/bin/zsh

# Due to how Mac OS handles the path, if we put this in .zshenv, it gets prefixed with the stuff from /usr/libexec/path_helper

llvm=/usr/local/opt/llvm # $(brew --prefix llvm)
brew=/opt/homebrew       # $(brew --prefix)
pyroot=$($brew/bin/brew --prefix python@3.11)
path=(
	$pyroot/bin
	$pyroot/libexec/bin
	${HOME}/.cargo/bin
	${HOME}/.nimble/bin
	${HOME}/.local/bin              # Python pip
	${HOME}/.deno/bin
	$llvm/bin
	$brew/bin
	$brew/sbin
	/usr/local/bin
	/usr/local/sbin               # usr/local/opt/python/libexec/bin/ # Python installed by Homebrew
	$path
)
typeset -U path # force path to only have unique values
export PATH

alias chrome="/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome"
alias firefox="/Applications/Firefox.app/Contents/MacOS/firefox"
alias edge="/Applications/Microsoft\ Edge.app/Contents/MacOS/Microsoft\ Edge"
alias servo="/Applications/Servo.app/Contents/MacOS/servo"


export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion


export DOTNET_CLI_TELEMETRY_OPTOUT=1

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

DISABLE_UPDATE_PROMPT=true
UPDATE_ZSH_DAYS=7

ENABLE_CORRECTION="true"
# just correct commands, not arguments
unsetopt CORRECT_ALL
# with spelling correction, assume dvorak kb
setopt DVORAK

COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git poetry)

source $ZSH/oh-my-zsh.sh

unsetopt share_history

if [[ $TERM = dumb ]]; then
	unset zle_bracketed_paste
fi

autoload -U +X compinit && compinit
autoload -U +X bashcompinit && bashcompinit

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
	export EDITOR='nano'
else
	export EDITOR='code -w'
fi

export HOMEBREW_NO_ANALYTICS=1
export HOMEBREW_DEVELOPER=1
export HOMEBREW_EDITOR=$EDITOR
export HOMEBREW_EVAL_ALL=1


if (( $+commands[pyenv] )); then
	export PYENV_ROOT="$HOME/.pyenv"
	export PATH="$PYENV_ROOT/bin:$PATH"
	eval "$(pyenv init -)"
fi
if (( $+commands[thefuck] )); then
	eval "$(thefuck --alias)"
fi
if (( $+commands[direnv] )); then
	eval "$(direnv hook zsh)"
fi
if (( $+commands[register-python-argcomplete] )); then
	eval "$(register-python-argcomplete ros2 colcon)"
fi
if (( !$+commands[open] )); then
	alias open=xdg-open
fi

# pnpm
export PNPM_HOME="/Users/dan/Library/pnpm"
export PATH="$PNPM_HOME:$PATH"
# pnpm end