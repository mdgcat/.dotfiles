#!/usr/bin/env zsh
cd "${0:A:h}"

doIt() {
    exclude_list=".DS_Store bootstrap.sh .functions .git .gitignore .gitmodules README.md .vim .vimrc setup.sh"

    for file in .*; do
        if ! [[ $exclude_list =~ $file ]]; then
            # Check that we're not symlinking the same file. Untested, I'll punt it for now.
            #[ $(ls -la ~/  | grep $file | grep -o '\-> [^$]*' | awk '{print $2}') -eq $(pwd)/$file ]
            if [[ -d ~/$file ]]; then
                ln -s -i "$(pwd)/$file" ~
            else
                ln -s -i "$(pwd)/$file" ~/$file
            fi
        fi
    done
}

if [[ "$1" == "--force" || "$1" == "-f" ]]; then
    doIt
else
    read -q "REPLY?This may overwrite existing files in your home directory. Are you sure? (y/n) "
    echo
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        doIt
    fi
fi
unset doIt
source ~/.zshrc
