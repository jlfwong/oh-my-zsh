# af-magic.zsh-theme
#
# Author: Jamie Wong, based on work by Peter Sobot, based on work by Andy Fleming
# URL: http://jamie-wong.com (http://petersobot.com (http://andyfleming.com/))
# Repo: https://github.com/andyfleming/oh-my-zsh
# Direct Link: https://github.com/andyfleming/oh-my-zsh/blob/master/themes/af-magic.zsh-theme
#
# Created on:		June 19, 2012
# Last modified on:	June 20, 2012

if [ $UID -eq 0 ]; then NCOLOR="red"; else NCOLOR="green"; fi
local return_code="%(?..%{$fg[red]%}%? ↵%{$reset_color%})"

# primary prompt
local smiley="%(?,%{$fg[green]%}✓%{$reset_color%},%{$fg[red]%}✗%{$reset_color%})"
PROMPT='$FG[237]╭  ------------------------------------------------------------
╰ %{$reset_color%}$FG[032] %~\
$(virtualenv_prompt_info)\
$(git_prompt_info_fast) \
${smiley} %{$reset_color%}\
$FG[105]%(!.#.»)%{$reset_color%} '
PROMPT2='%{$fg[red]%}\ %{$reset_color%}'
RPS1='${return_code}'

RPROMPT='$my_gray%*%{$reset_color%}% '

# Inside larger repositories, running git status takes a significant delay, so
# just get the branch information instead
function git_prompt_info_fast() {
  ref=$(git symbolic-ref HEAD 2> /dev/null) || \
  ref=$(git rev-parse --short HEAD 2> /dev/null) || return
  echo "$ZSH_THEME_GIT_PROMPT_PREFIX${ref#refs/heads/}$ZSH_THEME_GIT_PROMPT_SUFFIX"
}

# color vars
eval my_gray='$FG[237]'
eval my_orange='$FG[214]'

# git theming
ZSH_THEME_GIT_PROMPT_PREFIX="%{$FG[003]%}("
ZSH_THEME_GIT_PROMPT_SUFFIX=")%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN=""
ZSH_THEME_GIT_PROMPT_DIRTY="[staged]"
ZSH_THEME_GIT_PROMPT_UNTRACKED="[untracked]"

GIT_PS1_SHOWSTASHSTATE=""
GIT_PS1_SHOWDIRTYSTATE=""
GIT_PS1_SHOWUNTRACKEDFILES=""
GIT_PS1_SHOWUPSTREAM=""

# Taken from: https://github.com/tonyseek/oh-my-zsh-virtualenv-prompt
export VIRTUAL_ENV_DISABLE_PROMPT=1

ZSH_THEME_VIRTUAL_ENV_PROMPT_PREFIX="%{$fg[green]%}(virtualenv: "
ZSH_THEME_VIRTUAL_ENV_PROMPT_SUFFIX=")%{$reset_color%}"

function virtualenv_prompt_info() {
    if [ -n "$VIRTUAL_ENV" ]; then
        if [ -f "$VIRTUAL_ENV/__name__" ]; then
            local name=`cat $VIRTUAL_ENV/__name__`
        elif [ `basename $VIRTUAL_ENV` = "__" ]; then
            local name=$(basename $(dirname $VIRTUAL_ENV))
        else
            local name=$(basename $VIRTUAL_ENV)
        fi
        echo "$ZSH_THEME_VIRTUAL_ENV_PROMPT_PREFIX$name$ZSH_THEME_VIRTUAL_ENV_PROMPT_SUFFIX"
    fi
}
