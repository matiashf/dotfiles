if status is-interactive
    # Commands to run in interactive sessions can go here

    # A minimal, blazing-fast, and infinitely customizable prompt
    starship init fish | source

    # Dotfiles is where I keep my configs under version control
    alias dotfiles='/usr/bin/git --git-dir="$HOME/.dotfiles.git/" --work-tree="$HOME"'
    abbr --add .f dotfiles # Interactive expansion while typing

    set EDITOR "code" # VSCode

    set LESS "-FRXS" # Tailor less for interactive use

    # Password generation -- this might need some bugfixing
    abbr --add pwgen shuf -n 4 /usr/share/dict/words | tr '[:upper:]' '[:lower:]' | sed "s/'s\$//" | tr '\n' ' '; echo

    # I made a horrible mistake once. Never again.
    alias rm="rm -i"

    export PATH="$HOME/bin:$HOME/.local/bin:$PATH"

    mise activate fish | source
end
