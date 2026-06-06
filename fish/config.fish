alias nvconf="cd ~/.config/nvim; nvim"

function ta
    tmux attach -t (tmux list-sessions -F '#S' | fzf)
end

function new-worktree
    if test (count $argv) -eq 0
        echo "Usage: new-worktree <branch-name>"
        return 1
    end

    set branch $argv[1]

    # only sanitize for filesystem + tmux, NOT git
    set safe_branch (string replace -a "/" "-" $branch)
    set safe_branch (string replace -a "\\" "-" $safe_branch)
    set safe_branch (string replace -a "." "-" $safe_branch)

    set base_branch develop
    set base_dir ~/source/worktrees
    set target_dir "$base_dir/$safe_branch"

    set repo_root (git rev-parse --show-toplevel 2>/dev/null)
    if test $status -ne 0
        echo "Not inside a git repository"
        return 1
    end

    mkdir -p $base_dir

    git fetch origin $base_branch >/dev/null

    # Use REAL branch name for git
    git show-ref --verify --quiet "refs/heads/$branch"
    if test $status -ne 0
        echo "Creating branch '$branch' from 'origin/$base_branch'"
        git worktree add -b $branch $target_dir origin/$base_branch
    else
        echo "Using existing branch '$branch'"
        git worktree add $target_dir $branch
    end

    echo "Worktree created at $target_dir"

    # tmux uses safe name only
    set session $safe_branch

    tmux has-session -t $session 2>/dev/null
    if test $status -eq 0
        tmux attach -t $session
        return 0
    end

    tmux new-session -d -s $session -c $target_dir
    tmux send-keys -t $session "dotnet build" C-m
    tmux send-keys -t $session "nvim ." C-m
    tmux attach -t $session
end
if status is-interactive
    # Commands to run in interactive sessions can go here
end
