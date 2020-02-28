#if [ -f ~/mydotfiles/bash/.bashrc ]; then
#    . ~/mydotfiles/bash/.bashrc
#fi

# alias name=value
# alias name='command'
# alias name='command arg1 arg2'
# alias name='/path/to/script'
# alias name='/path/to/script.pl arg1'



# Default
# PS1='\[\033]0;$TITLEPREFIX:$PWD\007\]\n\[\033[32m\]\u@\h \[\033[35m\]$MSYSTEM \[\033[33m\]\w\[\033[36m\]`__git_ps1`\[\033[0m\]\n$ '
# Use on Pc
#PS1='\[\033]0;$TITLEPREFIX:$PWD\007\]\n\[\033[32m\]\u@\h \[\033[35m\][\T] \[\033[33m\]\w\[\033[36m\]`__git_ps1`\[\033[0m\]\n$ '
#  Use on phone
PS1='\[\033]0;$TITLEPREFIX:$PWD\007\]\n\[\033[32m\]Hasan@i50 \[\033[35m\][\T] \[\033[33m\]\w\[\033[36m\]\[\033[0m\]\n$ '



# Yarn  & npm 
alias ys='yarn start'
alias yd='yarn dev'
alias yul='yarn upgrade-interactive --latest'
alias ns='npm start'
alias nd='npm run dev'

# Vim
alias vim=nvim

# Tmux
alias tm=tmux

# handy short cuts #
alias bashrc="vim ~/mydotfiles/bash/.bashrc"
alias x='exit'
alias ..='cd ..'
alias h='history'
alias o='explorer'
alias open='explorer'

# kill port
alias fipid='netstat -ano | findstr'
alias kipid='taskkill /PID'

## Colorize the ls output ##
alias ls='ls --color=auto'
## Use a long listing format ##
alias ll='ls -la'
## Show hidden files ##
alias l.='ls -d .* --color=auto'

# handy date shortcuts #
alias now='date +"%T"'
alias nowdate='date +"%d-%m-%Y"'

## Colorize the grep command output for ease of use (good for log files)##
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
