# Define colors
local light_green="%{$FG[154]%}"
local green="%{$fg_bold[green]%}"
local red="%{$fg_bold[red]%}"
local cyan="%{$fg_bold[cyan]%}"
local yellow="%{$fg_bold[yellow]%}"
local blue="%{$fg_bold[blue]%}"
local magenta="%{$fg_bold[magenta]%}"
local white="%{$fg_bold[white]%}"
local reset="%{$reset_color%}"

local -a color_array
color_array=($light_green $green $red $cyan $yellow $blue $magenta $white)

# Directory info.
dir() {
    [[ -n $1 ]] && echo -n $1
}

# Dir: current working directory
prompt_dir() {
  # only print current working directory
  # dir '%1~'

  # print nearly 3-level working directory
  dir '%3~'

  # show absolute working directory
  # dir '%~'
}

local username_normal_color=$light_green
local username_root_color=$red
local hostname_normal_color=$light_green
local hostname_root_color=$red


local -a username_color
username_color=%(!.$username_root_color.$username_normal_color)
local -a hostname_color
hostname_color=%(!.$hostname_root_color.$hostname_normal_color)

local username_command="%n"
local hostname_command="%m"

local username_output="%(!..$username_color$username_command$reset@)"
local hostname_output="$hostname_color$hostname_command$reset"

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
$username_output$hostname_output: \
%{$terminfo[bold]$fg[yellow]%}${current_dir} %{$reset_color%}\
${git_info}\
%{$fg[white]%}[%*]
%${ret_status}%{$reset_color%}"