set -x http_proxy 'http://172.18.103.28:8080'
set -x https_proxy $http_proxy
set -x HTTP_PROXY $http_proxy
set -x HTTPS_PROXY $http_proxy
set -x EDITOR nvim
set -x LC_ALL en_US.UTF-8

# set -x theme_color_scheme zenburn

set -x ws /home/kkolivas/Workspace
set -x sql $ws/sql\ generator
set -x cdb $ws/cdb
set -x db $ws/db
set -x mig $cdb/migration

set -x DB /home/kkolivas/Workspace/cdb/db
set -x ACT /home/kkolivas/Workspace/cdb/db/active
set -x HIST /home/kkolivas/Workspace/cdb/db/hist
set -x MIG /home/kkolivas/Workspace/cdb/migration

# Fish VI Cursors
set -x fish_cursor_default      block       blink
set -x fish_cursor_insert       line        blink
set -x fish_cursor_replace_one  underscore  blink
set -x fish_cursor_visual       block

set -x theme_color_scheme gruvbox

##################################
##           Aliases            ##
##################################

############
# Sql Plus #
############
alias s+ 'sqlplus'

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

######################
## Fish completions ##
######################
complete -c migration_ctl \
         -a "migrate reset clean reset-conf" \
         -s d -l dryrun \
         -s n -l no-update \
         -l no-gen-finalize \
         -s v -l version \
         -s u -l update-version \
         -l no-checkout \
         -l deploy-version \
         -s t -l target-system

#########
## SSH ##
#########

alias ssh-vault 'ssh -i ~/.ssh/id_rsa kkolivas@p-athex-vault'

