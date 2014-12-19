# Custom version of git_prompt_status.
git_prompt_status () {
	INDEX=$(command git status --porcelain -b 2> /dev/null) 
	STATUS="" 


	# The icons will be in REVERSE order of how they are defined here:

	# Untracked.
	if $(echo "$INDEX" | grep -E '^\?\? ' &> /dev/null)
	then
		STATUS="$ZSH_THEME_GIT_PROMPT_UNTRACKED$STATUS" 
	fi

	# Stashed status
	if $(command git rev-parse --verify refs/stash >/dev/null 2>&1)
	then
		STATUS="$ZSH_THEME_GIT_PROMPT_STASHED$STATUS" 
	fi

	# Unmerged file
	if $(echo "$INDEX" | grep '^UU ' &> /dev/null)
	then
		STATUS="$ZSH_THEME_GIT_PROMPT_UNMERGED$STATUS" 
	fi

	# Ahead remote
	if $(echo "$INDEX" | grep '^## .*ahead' &> /dev/null)
	then
		STATUS="$ZSH_THEME_GIT_PROMPT_AHEAD$STATUS" 
	fi

	# Behind remote
	if $(echo "$INDEX" | grep '^## .*behind' &> /dev/null)
	then
		STATUS="$ZSH_THEME_GIT_PROMPT_BEHIND$STATUS" 
	fi

	# Diverted remote
	if $(echo "$INDEX" | grep '^## .*diverged' &> /dev/null)
	then
		STATUS="$ZSH_THEME_GIT_PROMPT_DIVERGED$STATUS" 
	fi

	# Modified.
	if $(echo "$INDEX" | grep '^ M ' &> /dev/null)
	then
		STATUS="$ZSH_THEME_GIT_PROMPT_MODIFIED$STATUS" 
	elif $(echo "$INDEX" | grep '^AM ' &> /dev/null)
	then
		STATUS="$ZSH_THEME_GIT_PROMPT_MODIFIED$STATUS" 
	elif $(echo "$INDEX" | grep '^ T ' &> /dev/null)
	then
		STATUS="$ZSH_THEME_GIT_PROMPT_MODIFIED$STATUS" 
	fi

	# Renamed.
	if $(echo "$INDEX" | grep '^R  ' &> /dev/null)
	then
		STATUS="$ZSH_THEME_GIT_PROMPT_RENAMED$STATUS" 
	fi

	# Deleted
	if $(echo "$INDEX" | grep '^ D ' &> /dev/null)
	then
		STATUS="$ZSH_THEME_GIT_PROMPT_DELETED$STATUS" 
	elif $(echo "$INDEX" | grep '^D  ' &> /dev/null)
	then
		STATUS="$ZSH_THEME_GIT_PROMPT_DELETED$STATUS" 
	elif $(echo "$INDEX" | grep '^AD ' &> /dev/null)
	then
		STATUS="$ZSH_THEME_GIT_PROMPT_DELETED$STATUS" 
	fi

	# Added.
	if $(echo "$INDEX" | grep '^A  ' &> /dev/null)
	then
		STATUS="$ZSH_THEME_GIT_PROMPT_ADDED$STATUS" 
	elif $(echo "$INDEX" | grep '^M  ' &> /dev/null)
	then
		STATUS="$ZSH_THEME_GIT_PROMPT_ADDED$STATUS" 
	fi


	echo $STATUS
}
