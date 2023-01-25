# Fig pre block. Keep at the top of this file.
[[ -f "$HOME/.fig/shell/zshrc.pre.zsh" ]] && builtin source "$HOME/.fig/shell/zshrc.pre.zsh"
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Get Logged In User
userName=$(/usr/bin/stat -f%Su /dev/console)

# Path to your oh-my-zsh installation.
export ZSH="/Users/kleblanc/.oh-my-zsh"

ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=(git extract macos)

source $ZSH/oh-my-zsh.sh

alias work="timer 10s && terminal-notifier -message 'Pomodoro'\
            -title 'Work Timer is up! Break Time! 🥳'\
            -appIcon '~/Pictures/Clock.png'\
            -sound Crystal"

alias break="timer 5m && terminal-notifier -message 'Pomodoro'\
            -title 'Break is over! Back To Work... 😓'\
            -appIcon '~/Pictures/Clock.icns'\
            -sound Crystal"

alias break-long="timer 10m && terminal-notifier -message 'Pomodoro'\
            -title 'Break is over! Back To Work... 😓'\
            -appIcon '~/Pictures/Clock.icns'\
            -sound Crystal"


# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

# Poetry Setup
export PATH="/Users/$userName/.local/bin:$PATH"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
export PATH="/usr/local/opt/ruby/bin:$PATH"
export PATH="$HOME/.gem/ruby/3.0.0/bin:$PATH"

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

#PYENV Setup
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"

# Fig post block. Keep at the bottom of this file.
[[ -f "$HOME/.fig/shell/zshrc.post.zsh" ]] && builtin source "$HOME/.fig/shell/zshrc.post.zsh"
