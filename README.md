# matiashf/dotfiles

This repository manages my dotfiles with git, inspired by
[harfangk](https://harfangk.github.io/2016/09/18/manage-dotfiles-with-a-git-bare-repository.html).

## Bootstrapping a new machine

- Fish: `apt install fish && chsh -s /usr/bin/fish`
- [Chrome](https://www.google.com/chrome/)
- [VSCode](https://code.visualstudio.com/) + turn on sync with github account
- [Starship](https://starship.rs/)
- [Mise](https://github.com/jdx/mise)
- [Docker](https://docs.docker.com/engine/install/ubuntu/#install-using-the-repository)
- Add [GitHub's SSH key fingerprints](https://docs.github.com/en/authentication/keeping-your-account-and-data-secure/githubs-ssh-key-fingerprints)

```
apt install rustup
```

```
gh auth login
alias dotfiles='/usr/bin/git --git-dir="$HOME/.dotfiles.git/" --work-tree="$HOME"'
alias .f=dotfiles
gh repo clone matiashf/dotfiles "$HOME/.dotfiles.git" -- --bare
dotfiles checkout
dotfiles config --global status.showUntrackedFiles no
dotfiles config include.path ~/.gitconfig.public
run-parts --exit-on-error ~/.dotfiles
```
