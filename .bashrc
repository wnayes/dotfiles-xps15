#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Set colors
eval $(dircolors -b ~/.dir_colors)
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# Environment variables
export LANG=en_US.UTF-8
export EDITOR=vim
GPG_TTY=$(tty)
export GPG_TTY
export BOSE_ADDR=192.168.2.101

# Aliases
. ~/.aliases
. ~/.wine_aliases
. ~/.aliases_work

# Prompt formatting
#PS1='\u@\h \W\$ '
PS1="$(if [[ ${EUID} == 0 ]];
       then echo '\[\033[01;31m\]\h';
       else echo '\[\033[01;32m\]\u@\h';
       fi)\[\033[01;34m\] \w \$\[\033[00m\] "

# Completion in git
source /usr/share/git/completion/git-completion.bash

# Completion for pass
source /usr/share/bash-completion/completions/pass

# Manpages coloring
man() {
  env LESS_TERMCAP_mb=$'\E[01;31m' \
      LESS_TERMCAP_md=$'\E[01;31m' \
      LESS_TERMCAP_me=$'\E[0m' \
      LESS_TERMCAP_se=$'\E[0m' \
      LESS_TERMCAP_so=$'\E[01;44;33m' \
      LESS_TERMCAP_ue=$'\E[0m' \
      LESS_TERMCAP_us=$'\E[01;32m' \
  man "$@"
}

# Compile and execute C on-the-fly.
csource() {
  [[ $1 ]]    || { echo "Missing operand" >&2; return 1; }
  [[ -r $1 ]] || { printf "File %s does not exist or is not readable\n" "$1" >&2; return 1; }
  local output_path=${TMPDIR:-/tmp}/${1##*/};
  gcc "$1" -o "$output_path" && "$output_path";
  rm "$output_path";
  return 0;
}
