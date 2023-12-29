# Aliases
source $ZDOTDIR/aliases

# Options
setopt autocd extendedglob nomatch
unsetopt beep notify

# Completion
zmodload zsh/complist
bindkey -M menuselect 'c' vi-backward-char
bindkey -M menuselect 's' vi-up-line-or-history
bindkey -M menuselect 'r' vi-forward-char
bindkey -M menuselect 't' vi-down-line-or-history
zstyle :compinstall filename '/home/tristan/.config/zsh/.zshrc'
autoload -Uz compinit; compinit
_comp_options+=(globdots) # With hidden files
source $ZDOTDIR/completion.zsh

# Highlighting
#source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Prompt
fpath=($ZDOTDIR/ $fpath)
autoload -Uz prompt; prompt

