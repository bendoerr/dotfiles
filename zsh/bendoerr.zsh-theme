# Base Colors
_MY_COLOR_USER="$fg_bold[yellow]"
_MY_COLOR_DIR="$fg_bold[cyan]"
_MY_COLOR_BRANCH="$fg_bold[green]"

# Formats:
#   %b - branchname
#   %u - unstagedstr (see below)
#   %c - stagedstr (see below)
#   %a - action (e.g. rebase-i)
#   %R - repository path
#   %S - path in the repository
local _MY_BRANCH_FORMAT="on ${_MY_COLOR_BRANCH}%c%u%b$reset_color"
local _MY_ACTION_FORMAT="($fg[yellow]%a%f%k$reset_color)"
local _MY_UNSTAGED_FORMAT="$reset_color$fg_bold[red]"
local _MY_STAGED_FORMAT="$reset_color%F{green}"

function _my_prompt_precmd {
  # Check for untracked files or updated submodules since vcs_info does not.
	local reformat_branch
  if [[ -n $(git ls-files --other --exclude-standard 2> /dev/null) ]]; then
    reformat_branch="${_MY_BRANCH_FORMAT} %F{magenta}✗%f"
  else
    reformat_branch="${_MY_BRANCH_FORMAT}"
  fi

  zstyle ':vcs_info:*:prompt:*' formats "${reformat_branch}"
  vcs_info 'prompt'
}

function _my_prompt_setup() {
	# Use vcs_info since it's portable between VCSs
	autoload -Uz vcs_info

	# Add hook for calling vcs_info before each command
  add-zsh-hook precmd _my_prompt_precmd

	# Set vcs_info parameters.
  zstyle ':vcs_info:*' enable bzr git hg svn
  zstyle ':vcs_info:*:prompt:*' check-for-changes true
  zstyle ':vcs_info:*:prompt:*' unstagedstr "${_MY_UNSTAGED_FORMAT}"
  zstyle ':vcs_info:*:prompt:*' stagedstr "${_MY_STAGED_FORMAT}"
  zstyle ':vcs_info:*:prompt:*' actionformats "${_MY_BRANCH_FORMAT} ${_MY_ACTION_FORMAT}"
  zstyle ':vcs_info:*:prompt:*' formats "${_MY_BRANCH_FORMAT}"
  zstyle ':vcs_info:*:prompt:*' nvcsformats   ""

  # Set git-info parameters.
  zstyle ':prezto:module:git:info' verbose 'yes'
  zstyle ':prezto:module:git:info:ahead' format " with $fg_bold[magenta]unpushed$reset_color"
  zstyle ':prezto:module:git:info:behind' format " with $fg[magenta]unpulled$reset_color"
  zstyle ':prezto:module:git:info:keys' format 'prompt' '%A%B'

  PROMPT="
${color_user}%n%f%b in ${color_dir}%~%f%b "'${vcs_info_msg_0_}'"
› "
  RPROMPT=''
}

_my_prompt_setup
