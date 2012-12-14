cyan="%{$fg[cyan]%}"
blue="%{$fg[blue]%}"
dark_grey="%{$fg_bold[cyan]%}"
grey="%{$fg_bold[yellow]%}"
gold="%{$fg[yellow]%}"
dark_green="%{$fg_bold[green]%}"
green="%{$fg[green]%}"
orange="%{$fg_bold[red]%}"
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

ZSH_THEME_GIT_PROMPT_PREFIX="$c_git"
ZSH_THEME_GIT_PROMPT_SUFFIX="$def"
ZSH_THEME_GIT_PROMPT_DIRTY="$def$dark_green✗$def"
ZSH_THEME_GIT_PROMPT_CLEAN=""
ZSH_THEME_GIT_PROMPT_UNTRACKED="$red??$def "
ZSH_THEME_GIT_PROMPT_ADDED="$green"A"$def "
ZSH_THEME_GIT_PROMPT_MODIFIED="$gold"M"$def "
ZSH_THEME_GIT_PROMPT_RENAMED="$green"R"$def "
ZSH_THEME_GIT_PROMPT_DELETED="$red"D"$def "
ZSH_THEME_GIT_PROMPT_UNMERGED="$red"UU"$def "

function git_info() {
  if [[ -n $(git_prompt_info) ]]; then
    echo "[$(git_prompt_status)$c_git$(git_prompt_info)$def$gold@$(git_prompt_short_sha)$def] "
  fi
}

function prompt_char {
	if [ $UID -eq 0 ]; then echo "%{$fg[red]%}#%{$reset_color%}"; else echo $; fi
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
PROMPT="$last_cmd [$disp_pwd] \$(git_info)[$disp_rvm]
$c_host%m$def $(prompt_char) "

RPROMPT="$green"["$c_user%n$def $green- %*"]"$def"
