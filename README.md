## Stow for all of my dotfiles

run stow like

```
stow -t <location/to/root> <directory/to/stow>
```

This will automatically create symlinks for the files in the directory
and place them under the location specified.

This will respect the hierarchy of the files, so we need to put them in proper hierarchy in the stow directory itself

Samples

```
stow -t /home/sohom config
stow -t /home/sohom/work_space/scripts scripts
```
