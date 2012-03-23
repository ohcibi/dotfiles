[[ -f ~/.zshrc ]] && . ~/.zshrc
[[ -d ~/bin ]] && PATH=~/bin:"${PATH}"

#if logging in from tty1, load ssh keys and start X.
if [[ "$DISPLAY" = "" && "`tty`" = "/dev/tty1" ]]; then
  eval `keychain -q  --eval id_rsa`
  startx &
fi
if [[ "$DISPLAY" != "" || "`tty`" != "/dev/tty1" ]]; then
  eval `keychain -q  --eval id_rsa`
  cowsay -f bong `fortune`
fi

[[ -s "/home/ohcibi/.rvm/scripts/rvm" ]] && source "/home/ohcibi/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
