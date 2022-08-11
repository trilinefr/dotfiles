export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$XDG_CONFIG_HOME/local/share"
export XDG_CACHE_HOME="$XDG_CONFIG_HOME/cache"

export EDITOR="vim"
export VISUAL="vim"

export ZDOTDIR="$XDG_CONFIG_HOME/zsh"

export HISTFILE="$ZDOTDIR/.zhistory"    # History filepath
export HISTSIZE=10000                   # Maximum events for internal history
export SAVEHIST=10000                   # Maximum events in history file

export LESS="-WRFXe --use-color"  # -W highlight last line on moves > half a page, -R allow ANSI characters to pass through unscathed
export PATH=/home/tristan/.local/bin:/usr/local/sbin:/usr/local/bin:/usr/bin:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl
export RANGER_LOAD_DEFAULT_RC=FALSE

export NEXTCLOUD_PHP_CONFIG=/etc/webapps/nextcloud/php.ini
