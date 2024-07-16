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

function fish_default_key_bindings
	fish_vi_key_bindings
end
 
function ls
	eza -la $argv
end

set EDITOR "nvim"
set -x MANPAGER "nvim +Man!"
