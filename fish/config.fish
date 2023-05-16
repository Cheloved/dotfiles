set -gx FZF_DEFAULT_OPTS "--multi --height=50% --margin=5%,2%,2%,5% --layout=reverse-list --border=double --info=inline --prompt='\$>' --pointer='→' --marker='♡' --header='CTRL-c or ESC to quit' --color='dark,fg:magenta'"

alias r="ranger"
alias nv="neovide&"
alias sd "cd ~ && cd (find * -type d | fzf)"

if status is-interactive
    # Commands to run in interactive sessions can go here
end


