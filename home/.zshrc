# OH MY ZSH!
# https://github.com/robbyrussell/oh-my-zsh

# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/ and ~/.oh-my-zsh/custom/themes/
ZSH_THEME="fluttershutter"
if [ $ITERM_PROFILE = 'BPython' ]; then
    # A nice, light theme.
    ZSH_THEME="jreese"
fi

# Let red dots to be displayed while waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Disable marking untracked files under VCS as dirty. This makes repository
# status check for large repositories much, much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(
    git
    fabric
    # System package managers
    brew

    # Virtualbox stuff!
    virtualbox vmprompt

    # Programming language package managers
    sbt rebar 

    # Programming lanaguages
    scala python

    # Extra features.
    colored-man osx
    # Shell stuff.
    tmuxinator virtualenvwrapper autojump

    # 😸
    nyan
)

export PROJECT_HOME=~/Projects/

# Do that Oh My ZSH magic!
source $ZSH/oh-my-zsh.sh

# `gm`, imported from the git plugin, conflicts with GraphicsMagick
unalias gm


# Options #####################################################################

# Awesome globs
setopt extendedglob
setopt dotglob

# No clobber, no beep
unsetopt clobber beep

# Be polite about notifying background process termination
setopt no_notify


# HARDCODED RUBY AND PYTHON PATH
export PATH=$PATH:/usr/local/opt/ruby:$HOME/Library/Python/2.7/bin

export LANG="en_CA.UTF-8"

# Ma editor.
export EDITOR=vim
export VISUAL=vim

export MANPATH=$MANPATH:/usr/local/opt/erlang/lib/erlang/man

# Aliases... MY ALIASES!
source ~/.aliases
# Extra machine-specific stuff...
if [ -e ~/.source-this-extra.sh ] ; then
    source ~/.source-this-extra.sh
fi
