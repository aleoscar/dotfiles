# .bashrc

#starship
eval "$(starship init bash)"

eval "$(fzf --bash)"

eval "$(zoxide init bash --cmd cd)"

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

#Default flags
export FZF_DEFAULT_OPTS="--reverse --height=40%  --pointer='->' --no-info --no-separator --color='pointer:blue,gutter:-1'"

#aliases
alias vim=nvim
alias ls="eza --icons"
alias la="eza -a --icons"
alias ll="eza -l --icons --git"
alias grep=rg
alias neofetch=fastfetch
alias news="newsboat -q"
alias mail=neomutt
alias tablet="systemctl --user enable opentabletdriver.service --now"
alias open=xdg-open
alias pacinfo="pacman -Qq | fzf --preview 'pacman -Qi {}' --bind 'enter:execute(pacman -Qil {} | less)'"

killps ()
{
    ps -eaf | fzf | awk '{print $2}' | xargs kill
}

mkcdir ()
{
    mkdir -p -- "$1" &&
       cd -P -- "$1"
}

# function open() {
#     xdg-open $1 &> /dev/null
# }

function vif() {
    local file
    file=$(fzf)

    if [ $? -eq 0 ] && [ -n "$file" ]; then
        nvim "$file"
    fi
}

function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}
