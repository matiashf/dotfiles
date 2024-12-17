if status is-interactive
    # Commands to run in interactive sessions can go here

    # A minimal, blazing-fast, and infinitely customizable prompt
    starship init fish | source

    # Dotfiles is where I keep my configs under version control
    alias dotfiles='/usr/bin/git --git-dir="$HOME/.dotfiles.git/" --work-tree="$HOME"'
    abbr --add .f dotfiles # Interactive expansion while typing

    # Password generation -- this might need some bugfixing
    abbr --add pwgen shuf -n 4 /usr/share/dict/words | tr '[:upper:]' '[:lower:]' | sed "s/'s\$//" | tr '\n' ' '; echo

    # I made a horrible mistake once. Never again.
    alias rm="rm -i"

    # Several environment variables and PATH are configured in ~/.config/mise/config.toml
    ~/.local/bin/mise activate fish | source
else # Non-interactive, i.e. a script
    ~/.local/bin/mise activate fish --shims | source
end
