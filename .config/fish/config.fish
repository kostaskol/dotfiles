#############################
## Environmental Variables ##
#############################

# Fish VI Cursors
set -x fish_cursor_default      block       blink
set -x fish_cursor_insert       line        blink
set -x fish_cursor_replace_one  underscore  blink
set -x fish_cursor_visual       block

##############
## StarShip ##
##############

starship init fish | source

###########
# Various #
###########
alias ls 'lsd'
alias cp 'cp -i'
alias mv 'mv -i'

#######
# Vim #
#######
alias vim 'nvim'

#######
# Git #
#######
alias git-log 'git log --oneline --all --graph --decorate=full'
alias pull 'git pull'
alias push 'git push'
alias checkout 'git checkout'
alias branch 'git branch'
alias add 'git add'

#####################
# Git Abbreviations #
#####################
alias gp 'git pull'
alias gps 'git push'
alias gc 'git checkout'
alias gb 'git branch'
alias gs 'git status'
