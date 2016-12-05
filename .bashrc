# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific aliases and functions
export PATH=$PATH:$HOME/bin/

alias fixssh='source ~/bin/sshvars'
alias hsearch='history | grep'
alias gdiw='git diff --ignore-space-at-eol -w -b'
alias glh='git log | head'
alias find_resource_forks='find ./ -name "\._*"'


GIT_PS1_SHOWDIRTYSTATE=1
if [ -f ~/bin/git-prompt.sh ]; then
  . ~/bin/git-prompt.sh
fi

BLACK=$(tput setaf 0)
RED=$(tput setaf 1)
GREEN=$(tput setaf 2)
YELLOW=$(tput setaf 3)
BLUE=$(tput setaf 4)
MAGENTA=$(tput setaf 5)
CYAN=$(tput setaf 6)
WHITE=$(tput setaf 7)
BRIGHT=$(tput bold)
NORMAL=$(tput sgr0)
BLINK=$(tput blink)
REVERSE=$(tput smso)
UNDERLINE=$(tput smul)

CMD_SUCCESS="${GREEN}:${NORMAL}"
CMD_FAIL="${RED}!${NORMAL}"

CMD_STATUS="if [ \$? = 0 ]; then echo \"${CMD_SUCCESS}\"; else echo \"${CMD_FAIL}\"; fi"

# If id command returns zero, you’ve root access.
if [ $(id -u) -eq 0 ];
then # you are root, set red colour prompt
  PS1="\\[$(tput setaf 1)\\]\\u@\\h:\\w #\\[$(tput sgr0)\\]"
else # normal
  PS1="${GREEN}\u\${WHITE}@${CYAN}\h\${WHITE}:${YELLOW}\w${MAGENTA}\$(__git_ps1)\`${CMD_STATUS}\`${NORMAL}\n$"
fi

if [ -f ~/bin/git-completion.bash ]; then
  . ~/bin/git-completion.bash
fi
