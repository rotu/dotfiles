# Path to your oh-my-zsh installation.
export ZSH="/Users/dan/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

DISABLE_UPDATE_PROMPT=true 
UPDATE_ZSH_DAYS=1

ENABLE_CORRECTION="true"
# with spelling correction, assume dvorak kb
setopt dvorak

COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git node)

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
   export EDITOR='subl -w'
fi

export HOMEBREW_EDITOR=$EDITOR

if (( $+commands[thefuck] )); then
	eval $(thefuck --alias)
fi
