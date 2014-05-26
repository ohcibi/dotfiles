cyan="%{$fg[cyan]%}"
blue="%{$fg[blue]%}"
dark_grey="%{$fg_bold[cyan]%}"
grey="%{$fg_bold[yellow]%}"
gold="%{$fg[yellow]%}"
dark_green="%{$fg_bold[green]%}"
green="%{$fg[green]%}"
orange="%{$fg_bold[red]%}"
lambda="%F{166}"
red="%{$fg[red]%}"
def="%{$reset_color%}"
c_user=$gold
c_host=$dark_green
c_rvm=$cyan
c_git=$orange
c_pwd=$blue

function git_head() {
  if [[ -n `git status 2> /dev/null` ]]; then
    echo $(git show HEAD --format="oneline" | head -n 1 | cut -b 1-7)
  fi
}

ZSH_THEME_GIT_PROMPT_PREFIX="%F{1}%B"
ZSH_THEME_GIT_PROMPT_SUFFIX="%F{3}@%b"
ZSH_THEME_GIT_PROMPT_SHA_BEFORE="%F{3}%B"
ZSH_THEME_GIT_PROMPT_SHA_AFTER="%b"
ZSH_THEME_GIT_PROMPT_DIRTY="%F{2}%B✖%b"
ZSH_THEME_GIT_PROMPT_CLEAN=""
ZSH_THEME_GIT_PROMPT_UNTRACKED="%F{9}%B✸%b "
ZSH_THEME_GIT_PROMPT_ADDED="%F{2}%B✚%b "
ZSH_THEME_GIT_PROMPT_MODIFIED="%F{3}✂%b "
ZSH_THEME_GIT_PROMPT_RENAMED="%F{2}✎R%b "
ZSH_THEME_GIT_PROMPT_DELETED="%F{1}%B✝%b "
ZSH_THEME_GIT_PROMPT_UNMERGED="%F{9}%B❣%b "

function git_info() {
  if [[ -n $(git_prompt_info) ]]; then
    prompt="$(git_prompt_status)$(git_prompt_info)$(git_prompt_short_sha)"

    stashes=$(git stash list 2>/dev/null | wc -l | sed -e 's/ *//')
    if [[ $stashes > 0 ]]; then
      prompt="$prompt $grey($stashes stashed)$def"
    fi

    echo "[$prompt] "
  fi
}

function prompt_char {
	if [ $UID -eq 0 ]; then echo "%{$fg[red]%}#%{$reset_color%}"; else echo "%F{9}%Bλ%b"; fi
}

function my_battery_pct_prompt {
  BATTERY_GAUGE_SUFFIX=")"

  if [ plugged_in ]; then
    BATTERY_GAUGE_PREFIX="🔋 ("
  else
    BATTERY_GAUGE_PREFIX="("
  fi
  echo "[$(battery_pct_remaining)%%$(battery_level_gauge)]"
}

last_cmd="%(?,$green✔,$red✗)$def"
user_host="$c_user%n$def@$c_host%m$def"
disp_pwd="$c_pwd%~$def"
if which rvm-prompt &> /dev/null; then
  disp_rvm="$c_rvm\${\$(~/.rvm/bin/rvm-prompt i v g)#ruby-}$def"
else
  if which rbenv &> /dev/null; then
    disp_rvm="$c_rvm\${\$(rbenv version | sed -e 's/ (set.*$//' -e 's/^ruby-//')}$def"
  fi
fi
PROMPT="$last_cmd [$disp_pwd] \$(git_info)[$disp_rvm] \$(my_battery_pct_prompt)
%F{10}%B%m%b $(prompt_char) "

RPROMPT="$green"["$c_user%n$def $green- %*"]"$def"
