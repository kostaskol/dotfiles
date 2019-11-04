#############################
## Environmental Variables ##
#############################

set -x EDITOR nvim
set -x LC_ALL en_US.UTF-8
set -x theme_color_scheme zenburn

# Fish VI Cursors
set -x fish_cursor_default      block       blink
set -x fish_cursor_insert       line        blink
set -x fish_cursor_replace_one  underscore  blink
set -x fish_cursor_visual       block

##############
## StarShip ##
##############

starship init fish | source

