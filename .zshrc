git_branch() {
     local branch=$(git branch 2>/dev/null | sed -n '/^\*/s/^\* //p')
    if [ -n "$branch" ]; then
        echo "%F{yellow}⎇ %f%F{magenta}$branch%f "
    fi
}

if [[ $(arch) == 'arm64' ]];
then 
  PROMPT="%F{green}%d%f@%F{blue}M1%f $(git_branch)$ "
  export LDFLAGS="-L/opt/homebrew/Cellar/unixodbc/2.3.11/lib"
  export CPPFLAGS="-I/opt/homebrew/Cellar/unixodbc/2.3.11/include"
fi

if [[ $(arch) == 'i386' ]];
then
  PROMPT="%n@%m %1~ %# %{$fg[green]%}%A x86 ➜ ⎇ %F{magenta}$(git_branch)%f $ " 
  alias ibrew='/usr/local/bin/brew'
  alias pyenv86="arch -x86_64 pyenv"
fi


# pyenv
if command -v pyenv 1>/dev/null 2>&1; then
    if [ $(arch) = "i386" ]; then
        export PATH="$HOME/.pyenv-i386/bin:$PATH"
        eval "$(pyenv86 init -)"
        eval "$(pyenv86 virtualenv-init -)"
    else
        export PATH="$HOME/.pyenv/bin:$PATH"
        eval "$(pyenv init -)"
        eval "$(pyenv virtualenv-init -)"
    fi
fi

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/chris/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/chris/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/chris/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/chris/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

# Shell History

HISTFILE="$HOME/.zsh_history"
HISTSIZE=10000000
SAVEHIST=10000000

HISTORY_IGNORE="(ls|cd|pwd|exit|cd)*"

setopt EXTENDED_HISTORY      # Write the history file in the ':start:elapsed;command' format.
setopt INC_APPEND_HISTORY    # Write to the history file immediately, not when the shell exits.
setopt SHARE_HISTORY         # Share history between all sessions.
setopt HIST_IGNORE_DUPS      # Do not record an event that was just recorded again.
setopt HIST_IGNORE_ALL_DUPS  # Delete an old recorded event if a new event is a duplicate.
setopt HIST_IGNORE_SPACE     # Do not record an event starting with a space.
setopt HIST_SAVE_NO_DUPS     # Do not write a duplicate event to the history file.
setopt HIST_VERIFY           # Do not execute immediately upon history expansion.
setopt APPEND_HISTORY        # append to history file (Default)
setopt HIST_NO_STORE         # Don't store history commands
setopt HIST_REDUCE_BLANKS    # Remove superfluous blanks from each command line being added to the history.

plugins=(git fzf)

HIST_STAMPS="yyyy-mm-dd"
export FZF_DEFAULT_COMMAND='ag --hidden -g ""'

# Kubernetes command line autocompletion
source <(kubectl completion zsh)

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
