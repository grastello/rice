# .bashrc

# Source global definitions.
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific environment.
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]
then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

PS1="\[\033[00;37m\]\$(exit=\$?; if [[ \$exit != 0 ]]; then echo \"\[\033[00;31m\]X \$exit \"; fi)\[\033[00;32m\]\u\[\033[00;36m\] \W \[\033[00;31m\]\$(parse_git_branch)\[\033[00;32m\]\$\[\033[00m\] "

# get current git branch
parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d;s/* /[/;s/$/] /'
}

# Aliases.
alias c='clear'
alias q='exit'
alias ll='ls -laFoh --color'
alias l='ls -lFoh --color'
alias g='egrep -i '

alias ytm='youtube-dl -xic'
