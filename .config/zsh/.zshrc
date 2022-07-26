# Aliases
source $ZDOTDIR/aliases

# Options
setopt autocd extendedglob nomatch
unsetopt beep notify

# Completion
zstyle :compinstall filename '/home/tristan/.config/zsh/.zshrc'
autoload -Uz compinit; compinit
_comp_options+=(globdots) # With hidden files
source $ZDOTDIR/completion.zsh

# Highlighting
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Prompt
fpath=($ZDOTDIR/ $fpath)
autoload -Uz prompt; prompt
