#!/usr/bin/env zsh

0="${${ZERO:-${0:#$ZSH_ARGZERO}}:-${(%):-%N}}"
0="${${(M)0:#/*}:-$PWD/$0}"

typeset -g FTAG_VERSION=0.4

[[ -z ${(M)zsh_loaded_plugins:#lmburns/ftag} && -z ${fpath[(r)${0:h}*]} ]] && {
  fpath=( "${0:h}/ftag" "${fpath[@]}" )
  autoload -Uz ftag
}
