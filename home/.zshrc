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

# Disable auto updates!
DISABLE_AUTO_UPDATE="true"

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

    # System package managers
    brew

    # Fabric!
    fabric

    # Programming language package managers
    nvm rebar

    # Programming lanaguages
    python virtualenvwrapper

    # Hit ctrl-z in an empty prompt to fg a background progress.
    fancy-ctrl-z

    # Extra features.
    colored-man osx
    # Shell stuff.
    autojump

    # 😸
    nyan emoji
)

export PROJECT_HOME=~/Projects/

# Do that Oh My ZSH magic!
source $ZSH/oh-my-zsh.sh

# `gm`, imported from the git plugin, conflicts with GraphicsMagick
unalias gm


# Load rbenv automatically by appending
# the following to ~/.zshrc:

#eval "$(rbenv init -)"


# Options #####################################################################

# Awesome globs
setopt extendedglob
setopt dotglob

# No clobber, no beep
unsetopt clobber beep

# Be polite about notifying background process termination
setopt no_notify


# HARDCODED RUBY AND PYTHON PATH
#export PATH=$PATH:/usr/local/opt/ruby:$HOME/Library/Python/2.7/bin:/Users/eddieantonio/.gem/ruby/2.2.0/bin
#export PATH=~/anaconda3/bin:$PATH

export LANG="en_CA.UTF-8"
export LC_CTYPE="en_CA.UTF-8"

# Ma editor.
export EDITOR=vim
export VISUAL=vim

# Aliases... MY ALIASES!
source ~/.aliases
# Extra machine-specific stuff...
if [ -e ~/.source-this-extra.sh ] ; then
    source ~/.source-this-extra.sh
fi

# Dumb pyside stuff.
export DYLD_LIBRARY_PATH=/Library/Frameworks/Python.framework/Versions/3.4/lib/python3.4/site-packages/PySide

# Dumb nvm stuff
export NVM_DIR=~/.nvm
source $(brew --prefix nvm)/nvm.sh

# added by travis gem
[ -f /Users/eddieantonio/.travis/travis.sh ] && source /Users/eddieantonio/.travis/travis.sh

# AWESOME ZSH IGNORED PATTERNS!
zstyle ':completion::complete:vim:*' ignored-patterns \
    '*.o' '*.d' '*.pyc'

export LICENSE_OWNER='Eddie Antonio Santos'

# Pip MUST install only if a virtualenv is installed...
export PIP_REQUIRE_VIRTUALENV=true

test -e ${HOME}/.iterm2_shell_integration.zsh && source ${HOME}/.iterm2_shell_integration.zsh

export TYPEV_PATH=/Users/eddieantonio/Projects/CMPUT664_Project

#export http_proxy='http://localhost:2000/proxy.pac'
