#!/usr/bin/env fish

# Symlink definitions: (repo_path) (target_path)
set links \
    ".tmux"  "$HOME/.tmux" \

for i in (seq 1 2 (count $links))
    set src $links[$i]
    set dest $links[(math $i + 1)]

    set src_path (realpath $src)


    # ensure parent directory exists
    set dest_dir (dirname $dest)
    mkdir -p $dest_dir

    # if link already exists
    if test -L $dest
        set existing (readlink $dest)
        if test "$existing" = "$src_path"
            echo "OK: $dest already linked"

            continue
        else
            echo "Replacing wrong symlink: $dest"
            rm $dest
        end
    else if test -e $dest
        echo "Backing up existing file/folder: $dest -> $dest.backup"
        mv $dest "$dest.backup"
    end

    ln -s $src_path $dest
    echo "Linked $src_path -> $dest"
end
