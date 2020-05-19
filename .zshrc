export PATH="$HOME/.local/bin:$PATH"

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
   export EDITOR='nano'
else
   export EDITOR='subl -w'
fi

alias ls="ls -A --color=auto"
alias rosclean="rm -r ./build ./install ./log"
alias up="sudo echo; rosdep update; rosdep install --from /opt/ros/master/src --rosdistro=foxy --os=ubuntu:bionic -ry; sudo apt update && sudo apt full-upgrade && sudo apt autoremove; snap refresh" 



# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh
ZSH_THEME="agnoster"

DISABLE_UPDATE_PROMPT=true 
UPDATE_ZSH_DAYS=1
ENABLE_CORRECTION="true"
# with spelling correction, assume dvorak kb
setopt dvorak


# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
# https://github.com/robbyrussell/oh-my-zsh/wiki/Plugins
plugins=(git node)

source $ZSH/oh-my-zsh.sh

unsetopt share_history

if [[ $TERM = dumb ]]; then
  unset zle_bracketed_paste
fi

autoload -U +X compinit && compinit
autoload -U +X bashcompinit && bashcompinit

export DIRENV_LOG_FORMAT=
eval "$(direnv hook zsh)"
