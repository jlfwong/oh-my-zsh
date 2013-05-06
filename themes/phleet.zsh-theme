PROMPT='%{$fg[yellow]%}[${PWD/#$HOME/~}]%{$reset_color%} $(git_prompt_info)'

# git theming
ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[green]%}("
ZSH_THEME_GIT_PROMPT_SUFFIX="$(git_prompt_status))%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_CLEAN=""
ZSH_THEME_GIT_PROMPT_DIRTY="[staged]"
ZSH_THEME_GIT_PROMPT_UNTRACKED="[untracked]"
