#!/usr/bin/env fish

# Format:
# "path_in_repo:absolute_destination"
set links \
    ".tmux/.tmux.conf:$HOME/.tmux.conf" \
    ".tmux:$HOME/.tmux"

for link in $links
    set parts (string split ":" $link)

    set src $parts[1]
    set dest $parts[2]

    set src_path (realpath $src)

    if not test -e $src_path
        echo "ERROR: Source does not exist: $src"
        continue
    end

    # Ensure destination parent directory exists
    mkdir -p (dirname $dest)

    # Destination is already a symlink
    if test -L $dest
        set existing (realpath $dest)

        if test "$existing" = "$src_path"
            echo "OK: $dest already linked"
            continue
        end

        echo "Replacing incorrect symlink: $dest"
        rm -f $dest

    # Destination exists as a file or directory
    else if test -e $dest
        set backup "$dest.backup"

        echo "Backing up existing file/directory:"
        echo "  $dest -> $backup"

        mv $dest $backup
    end

    ln -s $src_path $dest
    echo "Linked $dest -> $src_path"
end
