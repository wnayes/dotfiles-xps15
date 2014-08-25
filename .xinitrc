#!/bin/sh
# ~/.xinitrc

if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

# Ensure .Xresources gets loaded.
[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources

# Remapping keyboard
if [ -s ~/.Xmodmap ]; then
  xmodmap ~/.Xmodmap
fi

# Start gpg-agent
eval $(gpg-agent --daemon --write-env-file "${HOME}/.gpg-agent-info")
if [ -f "${HOME}/.gpg-agent-info" ]; then
  . "${HOME}/.gpg-agent-info"
  export GPG_AGENT_INFO
fi

# Start Bumblebee, create VIRTUAL display, and configure monitors.
optirun true
intel-virtual-output
xrandr --output VIRTUAL2 --right-of HDMI1 --mode 1920x1080 --auto
xrandr --output LVDS1 --off

# Transparency
xcompmgr &
#unagi &

exec awesome

