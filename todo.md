## Autocompletion

Add autocompletion from GitHubCLI to zsh
- check other autocompletion options for zsh

```bash
sudo sh -c 'gh completion -s zsh > /usr/local/share/zsh/site-functions/_gh'
```

## Kitty conf
add installation of kitty via curl and add symlinks to ~/.local/bin 

`curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin`

```bash
mkdir -p ~/.local/bin
ln -sf ~/.local/kitty.app/bin/kitty ~/.local/bin/
ln -sf ~/.local/kitty.app/bin/kitten ~/.local/bin/
```


