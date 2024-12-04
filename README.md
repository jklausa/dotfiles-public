Dotfiles, you know? 

The setup relies on cloning the dotfiles using a bare repo approach, e.g. 

```
git clone --bare git@github.com:jklausa/dotfiles-public.git .dotfiles.git
```

To interact with the repo afterwards, you should use the alias defined in the
.gitconfig like so:

```
git dotfiles status
```

etc.

You might need to update the `Vundle submodule` manually:
```
cd .vim/bundle/Vundle.vim
git dotfiles submodule update --init --recursive
```

