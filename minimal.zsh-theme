ZSH_THEME_GIT_PROMPT_PREFIX="%{$reset_color%}%{$fg[white]%}["
ZSH_THEME_GIT_PROMPT_SUFFIX=" "
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[red]%}●%{$fg[white]%}]%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_AHEAD="%{$fg[red]%}⇡%{$fg[white]%}"
ZSH_THEME_GIT_PROMPT_BEHIND="%{$fg[white]%}⇣%{$fg[white]%}"
ZSH_THEME_GIT_PROMPT_DELETED="%{$fg[red]%}✗%{$fg[white]%}"
ZSH_THEME_GIT_PROMPT_CLEAN="]%{$reset_color%}"

#vcs_status() {
#    git_prompt_info
#}

PROMPT='%2~ $(git_prompt_info)$(git_prompt_status)%{$fg[white]%}»%b '
