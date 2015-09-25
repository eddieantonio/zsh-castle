# the oft-coveted mkscript function. It makes a script. In record time!
function mkscript {
    InterpreterPath=
    case $1 in
        *.pl)    InterpreterPath="/usr/bin/perl";;
        *.py)    InterpreterPath="/usr/bin/env python";;
        *.rb)    InterpreterPath="/usr/bin/env ruby";;
        *.sh)    InterpreterPath="/bin/sh";;
        *.scala) InterpreterPath="/usr/bin/env scala\n!#";;
        *)       InterpreterPath="/bin/sh"
    esac
    echo "#!$InterpreterPath" >>| $1 &&
    chmod +x $1 &&

    EditorOpts=
    case $EDITOR in
        vim)    EditorOpts='+norm Go';;
        emacs)  echo ':c' >> $1
    esac
    $EDITOR $EditorOpts $1
}

# Ctrl-z magic!
# https://gist.github.com/braidn/847209944a1f2377c568
# Press ctrl-z to toggle in and out of a program (e.g., a REPL or vim).
fancy-ctrl-z () {
  if [[ $#BUFFER -eq 0 ]]; then
    fg
    zle redisplay
  else
    zle push-input
  fi
}
zle -N fancy-ctrl-z
bindkey '^Z' fancy-ctrl-z

# Enable command-line comments:
setopt interactivecomments
