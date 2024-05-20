# Dependencies
# zsh-syntax-highlighting - syntax highlighting for ZSH in standard repos
# autojump - jump to directories with j or jc for child or jo to open in file manager
# zsh-autosuggestions - Suggestions based on your history

autoload -U colors && colors

# Custom Variables
EDITOR="nvim"
VISUAL="nvim"

# Keybindings
bindkey -v
bindkey '^n' history-search-forward  # only search matches for autosuggestions
bindkey '^p' history-search-backward  # only search matches for autosuggestions

# History:
HISTSIZE=5000
SAVEHIST=$HISTSIZE
HISTFILE=~/.zsh_history
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space  # don't record if command starts with a space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# Basic auto/tab complete:
autoload -U compinit
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'  # case-insensitive autosuggestions
zstyle ':completion:*' list-colors '${(s.:.)LS_COLORS}'
zmodload zsh/complist
compinit
_comp_options+=(globdots) # Include hidden files.
if [[ "$OSTYPE" == "darwin"* ]]; then
    [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
    source /usr/share/doc/fzf/examples/key-bindings.zsh
    source /usr/share/doc/fzf/examples/completion.zsh
fi

# Load aliases and shortcuts if existent.
[ -f "$HOME/zsh/aliasrc" ] && source "$HOME/zsh/aliasrc"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

eval "$(starship init zsh)"

# Load - should be the last thing in config
# zsh-autocomplete is not what we want and highlighting is annoying
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    neofetch
    source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh 2>/dev/null
    # source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null
    source /usr/share/autojump/autojump.zsh 2>/dev/null
elif [[ "$OSTYPE" == "darwin"* ]]; then
    source $HOMEBREW_PREFIX/share/zsh-autosuggestions/zsh-autosuggestions.zsh 2>/dev/null
    # source $HOMEBREW_PREFIX/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null
fi
