#
# ~/.bashrc
#

# If not running interactively, don't do anything
#powerline-daemon -q
#POWERLINE_BASH_CONTINUATION=1
#POWERLINE_BASH_SELECT=1
#. /usr/lib/python3.6/site-packages/powerline/bindings/bash/powerline.sh
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
#PS1='[\u@\h \W]\$ '
alias git-tree='git log --graph --oneline --decorate --all --color'
eval $(dircolors ~/.dircolors)
#if [ "$TERM" = "linux" ]; then
 # /bin/echo -e "
  #\e]P0003232
  #\e]P0003232
 # \e]P2343537
  #\e]P33edd20
 # \e]P4676a6c
 # \e]P5898d8f
 # \e]P6b1b5b9
 # \e]P7e1e2e4
  #\e]P82556db
  #\e]P9668e85
  #\e]PA95bc72
  #\e]PBc87993
  #\e]PC309a30
  #\e]PD5ca99a
  #\e]PE678ba2
  #\e]PF70934e
  #"
  # get rid of artifacts
  #clear
#fi
#PS1='\[\e[0;38m\]\u\[\e[m\] \[\e[1;34m\]\w\[\e[m\] \[\e[1;32m\]λ\[\e[m\] \[\e[1;37m\]'
#if [ "`id -u`" -eq 0 ]; then
   #PS1="[ \[\e[1;31m\]λ\[\e[1;32m\]\[\e[49m\] \W \[\e[0m\]] "
#else
   #PS1="[ \[\e[1;32m\]λ \W \[\e[0m\]] "
#fi
PS1="\[\033[38;5;012m\][\[\033[01;32m\]\u \[\033[01;90m\]\[\033[38;5;4m\]\w\[\033[38;5;012m\]] \[\033[38;5;27m\]λ \[\033[0m\]"

export EDITOR=vim

eval "$(thefuck --alias)"
# You can use whatever you want as an alias, like for Mondays:
eval "$(thefuck --alias FUCK)"
panda
alias clear='clear; echo; seq 1 $(tput cols) | sort -R | spark | lolcat; echo;' # Coloured
alias fixBrackets='bash /home/weznon/programming/git/scripts/fixLoneBrackets'
alias detectMissingBreaks='runhaskell /home/weznon/programming/git/scripts/dMBFiles/noCoerce.hs'
alias reset='cd /home/weznon; clear'
seq 1 $(tput cols) | sort -R | spark | lolcat; echo;
PROMPT_DIRTRIM=3
export PS1="$PS1"
