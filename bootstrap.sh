#!/bin/bash
cd "$(dirname "${BASH_SOURCE}")"

function doIt() {
    exclude_list="setup.sh .git .gitmodules .DS_store bootstrap.sh README.md .gitconfig .osx .path .prompt .vim .wgetrc more_python.txt requirements.txt tmux-powerline .brew .functions .gitignore"

    for file in .*; do
        if ! [[ $exclude_list =~ $file ]]
        then
            # Check that we're not symlinking the same file. Untested, I'll punt it for now.
            #[ $(ls -la ~/  | grep $file | grep -o '\-> [^$]*' | awk '{print $2}') -eq $(pwd)/$file ]
            if [ -d ~/$file ]; then # ln is weird for directories.
                ln -s -i $(pwd)/$file ~
            else
                ln -s -i $(pwd)/$file ~/$file
            fi
        fi
    done
}

if [ "$1" == "--force" -o "$1" == "-f" ]; then
    doIt
else
    read -p "This may overwrite existing files in your home directory. Are you sure? (y/n) " -n 1
    echo
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        doIt
    fi
fi
unset doIt
source ~/.bash_profile
