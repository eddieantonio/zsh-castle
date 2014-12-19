# Open manpage with Preview.app
# Uses ps2pdf conversion because it's faster
if [[ $OSTYPE[1,6] == "darwin" ]]; then
	function manp () {
        man -t $* | ps2pdf - - | open -faPreview
        #TROFFMAN=$(man -t $*)
        #if [[ $? -eq 0 ]]; then
            #print $TROFFMAN | ps2pdf - - | open -f -a Preview
        #fi
	}
fi

# the oft-coveted mkscript function. It makes a script. In record time!
function mkscript {
    InterpreterPath=
    case $1 in
        *.pl)    InterpreterPath="/usr/bin/perl";;
        *.py)    InterpreterPath="/usr/bin/env python";;
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

# Gets me in the habit of using a better Python...
alias ipy=ipython

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
