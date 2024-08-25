if status is-interactive
	function fish_greeting
		colorscript -r
	end
end

# for starship prompt
starship init fish | source
eval (/home/linuxbrew/.linuxbrew/bin/brew shellenv)

set -gx LDFLAGS "-L/home/linuxbrew/.linuxbrew/opt/postgresql@16/lib"
set -gx CPPFLAGS "-I/home/linuxbrew/.linuxbrew/opt/postgresql@16/include"

set -gx PKG_CONFIG_PATH "/home/linuxbrew/.linuxbrew/opt/postgresql@16/lib/pkgconfig"

set -x PATH $PATH /home/$USER/go/bin

set -x CPLUS_INCLUDE_PATH /usr/include/c++/11:/usr/include/x86_64-linux-gnu/c++/11

# for cursor visibility
set -gx WLR_NO_HARDWARE_CURSORS 1
set -gx python3 /usr/bin/python3

set -x ZYPP_MEDIANETWORK 1

function fish_default_key_bindings
	fish_vi_key_bindings
end

function ls
	eza -la --icons $argv
end

function suz
	sudo zypper $argv
end

# abbrevations
abbr -a n --position command nvim
abbr gs git status
abbr ga git add -A
abbr gc git commit
abbr gp git push
abbr gch git checkout


# Set up fzf key bindings
fzf --fish | source

set -x EDITOR "nvim"
set -x MANPAGER "nvim +Man!"

# setting zoxide
zoxide init fish | source
