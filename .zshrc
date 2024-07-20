# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

alias md="mkdir"
alias rm="rm -rf"

generate_random_name() {
    local names_file="$HOME/names.txt"
    local num_lines=$(wc -l < "$names_file")
    local random_line=$(( $RANDOM % num_lines + 1 ))
    sed -n "${random_line}p" "$names_file"
}

# Alias or function to call generate_random_name
alias randomname='generate_random_name'
alias random_name='generate_random_name'


# Define a function to kill processes by port
killport() {
  if [ -z "$1" ]; then
    echo "Usage: killport <port>"
    return 1
  fi
  local port=$1
  local pid=$(lsof -t -i:$port)
  if [ -n "$pid" ]; then
    kill -9 $pid
    echo "Killed process on port $port"
  else
    echo "No process found on port $port"
  fi
}


# paths
export PATH=~/.npm-global/bin:$PATH
export PATH=~/.cargo/env:$PATH
export FUNCNEST=20

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

## Zinit: Plug in manager

ZINIT_HOME="${XDG_DATA_HOME}:-${HOME/.local/share}/zinit/zinit.git"

## set up zinit dir, if not already there
if [ ! -d "$ZINIT_HOME" ]; then
	mkdir -p "$(dirname $ZINIT_HOME)"
	git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

# zinit config source
source "${ZINIT_HOME}/zinit.zsh"

# add p10k
zinit ice depth=1; zinit light romkatv/powerlevel10k


source /opt/homebrew/share/powerlevel10k/powerlevel10k.zsh-theme

# history for completion
HISTFILE=$HOME/.zhistory
SAVEHIST=2000
HISTSIZE=999
setopt share_history
setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_ignore_space
setopt hist_save_no_dups
setopt hist_find_no_dups
setopt hist_verify
setopt appendhistory
setopt sharehistory

# cycle through

# cycle through history suggestions
bindkey "^[[A" history-search-backward
bindkey "^[[B" history-search-forward

# OMZP snips
zinit snippet OMZP::git
zinit snippet OMZP::brew
zinit snippet OMZP::bun
zinit snippet OMZP::sudo
zinit snippet OMZP::command-not-found


# completion styling
alias ls='ls --color'
zstyle ':completion:*'  matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
#zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
zstyle ':fzf-tab:cokmplete:__zoxide_z:*' fzf-preview 'ls --color $realpath'

# source suggestions
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh


# eza better than ls
#alias ls="eza --color=always --long --no-filesize --icons=always --no-time --no-user --no-permissions"
alias ls="eza --color=always --long --icons=always"

# zoxide better than cd
eval "$(zoxide init zsh)"
alias cd="z"
alias vim="nvim"
alias c="clear"
alias r="reset"

# highlighting && completions
zinit light zsh-users/zsh-syntax-highlighting

if type brew &>/dev/null; then
	FPATH=$(brew --prefix)/share/zsh-completions:$FPATH

	autoload -Uz compinit
	compinit
fi

# set up fzf
zinit light Aloxaf/fzf-tab

# fzf fuzzy file finding
eval "$(fzf --zsh)"


# set up completions
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions

# load up completions
autoload -U compinit && compinit

zinit cdreplay -q

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh


# brew
eval "$(/opt/homebrew/bin/brew shellenv)"

#### hello world !! This is my new means of managing my dotfiles
