# Dependencies
# zsh-syntax-highlighting - syntax highlighting for ZSH in standard repos
# autojump - jump to directories with j or jc for child or jo to open in file manager
# zsh-autosuggestions - Suggestions based on your history

autoload -U colors && colors

# Custom Variables
EDITOR="nvim"
VISUAL="nvim"

# History:
HISTSIZE=5000
SAVEHIST=5000
HISTFILE=~/.zsh_history
setopt appendhistory

# Basic auto/tab complete:
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots) # Include hidden files.
if [[ "$OSTYPE" == "darwin"* ]]; then
    [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
    source /usr/share/doc/fzf/examples/key-bindings.zsh
    source /usr/share/doc/fzf/examples/completion.zsh
fi

# vi mode
bindkey -v

# Load aliases and shortcuts if existent.
[ -f "$HOME/zsh/aliasrc" ] && source "$HOME/zsh/aliasrc"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

eval "$(starship init zsh)"

# Load - should be the last thing in config
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    neofetch
    source /usr/share/zsh/zsh-autosuggestions/zsh-autosuggestions.zsh 2>/dev/null
    source /usr/share/zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null
    source /usr/share/autojump/autojump.zsh 2>/dev/null
elif [[ "$OSTYPE" == "darwin"* ]]; then
    source $HOMEBREW_PREFIX/share/zsh-autocomplete/zsh-autocomplete.plugin.zsh
    source $HOMEBREW_PREFIX/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi
