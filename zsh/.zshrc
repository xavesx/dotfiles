# pyfiglet -s -f small_slant $(fastfetch -s os --format json | jq -r '.[0].result.name') | lolcat && echo && fastfetch
#fastfetch
# fm6000 -r -c "random"
# fortune | cowsay -f tux
# echo -e '\n'
# PROMPT='%~ ❯ '

# Find and set branch name var if in git repository.
function git_branch_name()
{
  branch=$(git symbolic-ref HEAD 2> /dev/null | awk 'BEGIN{FS="/"} {print $NF}')
  if [[ $branch == "" ]];
  then
    :
  else
    echo ' %F{green}['$branch']%f'
  fi
}

# Enable substitution in the prompt.
setopt prompt_subst

# Config for prompt. PS1 synonym.
prompt='%~$(git_branch_name) ❯ '

#Alias
alias pip3="pip"
alias python3="python"
alias zsh="exec zsh"
alias cd="z" # zoxide

# eza
alias "ls-tree"='eza --all --tree --git --color=always --icons=always --no-filesize --no-permissions --no-time --no-user'
alias l="eza --color=always --long --git --no-filesize --icons=always --no-time --no-user --no-permissions"
alias ld='eza -lD' # lists only directories (no files)
alias lf='eza -lF --color=always | grep -v /' # lists only files (no directories)
alias lh='eza -dl .* --group-directories-first' # lists only hidden files (no directories)
alias ll='eza -al --group-directories-first' # lists everything with directories first
# alias ls='eza -alF --color=always --sort=size | grep -v /' # lists only files sorted by size
alias lt='eza -al --sort=modified' # lists everything sorted by time updated

# fzf
alias vs='code $(fzf -m --preview "bat --style=numbers --color=always {}")'
alias fd="fzf --preview='bat --color=always --style=numbers {}'"


export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"


# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/opt/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/opt/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/opt/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/opt/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

. "/Users/home/.deno/env"


eval "$(fzf --zsh)"
eval "$(zoxide init zsh)"

export BAT_THEME="gruvbox-dark"

# Completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' menu no

# Keybindings
bindkey -e
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward
# History
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# fzf-tab # `git clone https://github.com/Aloxaf/fzf-tab.git`
autoload -U compinit; compinit
source ~/.config/fzf-tab/fzf-tab.plugin.zsh
# source ~/fzf-tab/fzf-tab.plugin.zsh


# Homebrew
# zsh-syntax-highlighting

source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Bucklespring # `git clone https://github.com/zevv/bucklespring.git`
alias mm1='cd ~/.config/bucklespring; nohup ./buckle &> /dev/null & disown;cd -;clear;'
alias mm0="pkill -f './buckle'; clear;"