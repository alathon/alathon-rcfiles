# The following lines were added by compinstall

zstyle ':completion:*' completer _complete _ignored
zstyle :compinstall filename '/home/alathon/.zshrc'

autoload -Uz compinit
autoload -U promptinit
promptinit
prompt adam2

compinit
# End of lines added by compinstall
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=30000
SAVEHIST=30000
setopt appendhistory autocd nomatch
bindkey -e
# End of lines configured by zsh-newuser-install


# Color ls/grep
alias ls='cd && ls'
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias vps="ssh -t alathon@myvps screen -dRR main"
alias vpsirc="ssh -t alathon@myvps screen -dRR irc"
alias ls='ls --color=auto'

# Keybindings
bindkey "\e[1~" beginning-of-line # Home
bindkey "\e[4~" end-of-line # End
bindkey "\e[5~" beginning-of-history # PageUp
bindkey "\e[6~" end-of-history # PageDown
bindkey "\e[2~" quoted-insert # Ins
bindkey "\e[3~" delete-char # Del
bindkey "\e[5C" forward-word
bindkey "\eOc" emacs-forward-word
bindkey "\e[5D" backward-word
bindkey "\eOd" emacs-backward-word
bindkey "\e\e[C" forward-word
bindkey "\e\e[D" backward-word
# for rxvt
bindkey "\e[7~" beginning-of-line # Home
bindkey "\e[8~" end-of-line # End
# for non RH/Debian xterm, can't hurt for RH/Debian xterm
bindkey "\eOH" beginning-of-line
bindkey "\eOF" end-of-line
# for freebsd console
#bindkey "\e[H" beginning-of-line
#bindkey "\e[F" end-of-line

# Source autojump
. /etc/profile.d/autojump.zsh

# Path modifications
export PATH=/home/alathon/cross-gcc/bin/:$PATH
export PATH=/home/alathon/bin:$PATH
export TERM=rxvt
