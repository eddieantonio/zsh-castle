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

# Enable command-line comments:
setopt interactivecomments
