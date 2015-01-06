# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific aliases and functions
export PATH=$PATH:$HOME/bin/

alias fixssh='source ~/bin/sshvars'
alias hsearch='history | grep'
alias cs='php-cs-fixer fix --dry-run --diff -vvv'

# If id command returns zero, you’ve root access.
if [ $(id -u) -eq 0 ];
then # you are root, set red colour prompt
  PS1="\\[$(tput setaf 1)\\]\\u@\\h:\\w #\\[$(tput sgr0)\\]"
else # normal
  PS1="\[$(tput setaf 2)\]\\u\[$(tput sgr0)\] on \[$(tput setaf 6)\]\\H\[$(tput sgr0)\] in \[$(tput setaf 3)\]\\w\[$(tput sgr0)\]:\n\$"
fi

if [ -f ~/bin/git-completion.bash ]; then
  . ~/bin/git-completion.bash
fi
