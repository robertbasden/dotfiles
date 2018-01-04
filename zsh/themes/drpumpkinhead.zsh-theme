function battery_charge() {
    if [ -e /usr/local/bin/batcharge.py ]
    then
        echo `python /usr/local/bin/batcharge.py`
    else
        echo '';
    fi
}

parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'
}

function git_prompt_info() {
  ref=$(git symbolic-ref HEAD 2> /dev/null) || return
  echo " $(parse_git_dirty)$ZSH_THEME_GIT_PROMPT_PREFIX$(parse_git_branch)$ZSH_THEME_GIT_PROMPT_SUFFIX"
}

PROMPT='🎃  %m $(battery_charge)%{$fg[green]%}%~%{$fg_bold[blue]%}$(git_prompt_info)%{$reset_color%} '

ZSH_THEME_GIT_PROMPT_PREFIX="["
ZSH_THEME_GIT_PROMPT_SUFFIX="]$reset_color"
ZSH_THEME_GIT_PROMPT_DIRTY="$fg[red]"
ZSH_THEME_GIT_PROMPT_CLEAN="$fg[green]"
