# magic loading
for include ($HOME/.zshrc.d/*.zsh) source $include

# load modules
autoload -Uz compinit; compinit

# load dev if present, otherwise load chruby
if [[ -f /opt/dev/dev.sh ]]; then
  source /opt/dev/dev.sh
else
  source /usr/local/opt/chruby/share/chruby/chruby.sh
  source /usr/local/opt/chruby/share/chruby/auto.sh
  source /usr/local/etc/profile.d/z.sh
fi

# syntax highlighting
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# completions
fpath=(/usr/local/share/zsh-completions $fpath)

# colorize all the things
source /usr/local/etc/grc.bashrc
