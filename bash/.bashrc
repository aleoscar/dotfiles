# .bashrc

#starship
eval "$(starship init bash)"

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]; then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH
export EDITOR=/usr/bin/nvim

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
if [ -d ~/.bashrc.d ]; then
    for rc in ~/.bashrc.d/*; do
        if [ -f "$rc" ]; then
            . "$rc"
        fi
    done
fi
unset rc

#aliases
alias vi=nvim
alias ls="eza --icons"
alias la="eza -a --icons"
alias ll="eza -l --icons --git"
alias grep=rg
alias neofetch=fastfetch
alias news="newsboat -q"
alias mail=neomutt
alias tablet="systemctl --user enable opentabletdriver.service --now"
alias open=xdg-open

mkcdir ()
{
    mkdir -p -- "$1" &&
       cd -P -- "$1"
}

# function open() {
#     xdg-open $1 &> /dev/null
# }

function vif() {
    nvim $(fzf)
}
