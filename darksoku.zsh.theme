# Directory info.
dir() {
    [[ -n $1 ]] && echo -n $1
}

# Dir: current working directory
prompt_dir() {
  # only print current working directory
  # dir '%1~'

  # print nearly 5-level working directory
  dir '%5~'

  # show absolute working directory
  # dir '%~'
}

local current_dir=$(prompt_dir)

# ret status
local ret_status="(?:%{$fg_bold[green]%}➜ :%{$fg_bold[red]%}➜ )"

# VCS
YS_VCS_PROMPT_PREFIX="%{$fg_bold[white]%}[%{$reset_color%}%{$fg_bold[cyan]%}"
YS_VCS_PROMPT_SUFFIX="%{$fg_bold[white]%}]%{$reset_color%} "
YS_VCS_PROMPT_DIRTY=" %{$fg_bold[red]%}✗"
YS_VCS_PROMPT_CLEAN=" %{$fg[green]%}√"

# Git info.
local git_info='$(git_prompt_info)'
ZSH_THEME_GIT_PROMPT_PREFIX="$YS_VCS_PROMPT_PREFIX"
ZSH_THEME_GIT_PROMPT_SUFFIX="$YS_VCS_PROMPT_SUFFIX"
ZSH_THEME_GIT_PROMPT_DIRTY="$YS_VCS_PROMPT_DIRTY"
ZSH_THEME_GIT_PROMPT_CLEAN="$YS_VCS_PROMPT_CLEAN"

# Prompt format: # DIRECTORY [GIT_BRANCH STATE GIT_SHA] [TIME] \n ➜
PROMPT="%{$terminfo[bold]$fg[blue]%}#%{$reset_color%} \
%{$terminfo[bold]$fg[yellow]%}${current_dir} %{$reset_color%}\
${git_info}\
%{$fg[white]%}[%*]
%${ret_status}%{$reset_color%}"