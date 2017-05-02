[[ $PS1 && -f /usr/share/bash-completion/bash_completion ]] && \
  . /usr/share/bash-completion/bash_completion

export NVM_DIR="/Users/paris/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

if [ -f ~/.git-completion.bash ]; then
  source ~/.git-completion.bash
fi

if [ -f ~/.bash_git ]; then
  source ~/.bash_git
fi

# tabtab source for electron-forge package
# uninstall by removing these lines or running `tabtab uninstall electron-forge`
[ -f /Users/paris/.config/yarn/global/node_modules/tabtab/.completions/electron-forge.bash ] && . /Users/paris/.config/yarn/global/node_modules/tabtab/.completions/electron-forge.bash