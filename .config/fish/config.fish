if status is-interactive
	function fish_greeting
		# colorscript -r
		pokemon-colorscripts -sr
	end
end

# for starship prompt
# starship init fish | source

# homebrew
# uninstalled this evn polluter
# eval (/home/linuxbrew/.linuxbrew/bin/brew shellenv)


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
abbr lg lazygit
abbr doc docker-compose


# Set up fzf key bindings
fzf --fish | source

set -x EDITOR "nvim"
set -x MANPAGER "nvim +Man!"

# setting zoxide
zoxide init fish | source




# flutter path set
set -x PATH /home/hitmonlee/sdk_flutter/flutter/bin/ $PATH

# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH

# dart and flutter related

set --export DART_BIN "$HOME/.pub-cache/bin"
set --export PATH $DART_BIN $PATH

# sway env variables
# if test -f ~/.profile
#     source ~/.profile
# end
