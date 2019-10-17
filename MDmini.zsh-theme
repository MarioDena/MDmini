# Made by Mario Dena 2019
# Based on gnzh theme

setopt prompt_subst

() {

local PR_USER PR_USER_OP PR_PROMPT PR_HOST

# Check the UID
if [[ $UID -ne 0 ]]; then # normal user
  PR_PROMPT='%f➤ %f'
else # root
  PR_PROMPT='%F{red}➤ %f'
fi

# Check if we are on SSH or not
if [[ -n "$SSH_CLIENT"  ||  -n "$SSH2_CLIENT" ]]; then
  PR_HOST='%F{red}%M%f' # SSH
else
  PR_HOST='%F{green}%M%f' # no SSH
fi


local return_code="%(?..%F{red}%? ↵%f)"

local user_host="${PR_HOST}"
local current_dir="%B$FG[032]%~%f%b"
local git_branch='$FG[078]%$(git_prompt_info)'

PROMPT="╭─ ${user_host} ${current_dir} ${git_branch} %{$reset_color%}
╰─$PR_PROMPT "
RPROMPT="${return_code}"

ZSH_THEME_GIT_PROMPT_PREFIX=" ["
ZSH_THEME_GIT_PROMPT_SUFFIX="] "

}
