# OH MY ZSH!
# https://github.com/robbyrussell/oh-my-zsh

# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="fluttershutter"
if [ $ITERM_PROFILE = 'BPython' ]; then
    # A nice, light theme.
    ZSH_THEME="jreese"
fi

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
# DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
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
    #npm # This one takes waaaaaaaaay too long to start up.

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
source $ZSH/oh-my-zsh.sh

# `gm`, imported from the git plugin, conflicts with GraphicsMagick
unalias gm

# Awesome globs
setopt extendedglob
setopt dotglob

# No clobber, no beep
unsetopt clobber beep


# HARDCODED RUBY AND PYTHON PATH
export PATH=$PATH:/usr/local/opt/ruby:/Users/eddieantonio/Library/Python/2.7/bin

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
