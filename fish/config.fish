alias nvconf="cd ~/.config/nvim; nvim"

function ta
    tmux attach -t (tmux list-sessions -F '#S' | fzf)
end

if status is-interactive
    # Commands to run in interactive sessions can go here
end
