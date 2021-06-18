#!/usr/bin/env zsh

0="${${ZERO:-${0:#$ZSH_ARGZERO}}:-${(%):-%N}}"

fpath=( "${0:h}/ftag" "${fpath[@]}" )
autoload -Uz ftag
