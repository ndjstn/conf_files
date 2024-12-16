# Enable Powerlevel10k instant prompt
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Path to your Oh My Zsh installation
export ZSH="$HOME/.oh-my-zsh"

# Theme configuration
ZSH_THEME="powerlevel10k/powerlevel10k"

# Plugins
plugins=(git zsh-autosuggestions zsh-syntax-highlighting zsh-completions fzf)

# Load Oh My Zsh
source $ZSH/oh-my-zsh.sh

# Fix for FZF plugin error
export FZF_BASE="$HOME/.fzf"

# Load Powerlevel10k configuration if present
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Function to show active virtual environment or Conda environment
virtualenv_info() {
    if [[ -n "$VIRTUAL_ENV" ]]; then
        echo "($(basename "$VIRTUAL_ENV"))"
    elif [[ -n "$CONDA_DEFAULT_ENV" ]]; then
        echo "($CONDA_DEFAULT_ENV)"
    fi
}

# Customize the prompt to include the virtualenv/Conda info
PROMPT='$(virtualenv_info) %F{cyan}%n@%m%f %F{blue}%~%f %# '


# User configuration
# Set language environment
export LANG=en_US.UTF-8

# Preferred editor
export EDITOR='nvim'
