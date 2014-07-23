autoload colors && colors

export WHICHGIT=$(which git)

git_dirty() {
  st=$(expr $($WHICHGIT status --porcelain 2>/dev/null | grep -v "^??" | wc -l))
  if [[ "$st" == "" ]]
  then
    echo ""
  else
    if [[ "$st" == "0" ]]
    then
      echo "on %{$fg_bold[green]%}$(git_prompt_info)%{$reset_color%}"
    else
      echo "on %{$fg_bold[red]%}$(git_prompt_info)%{$reset_color%}"
    fi
  fi
}

git_prompt_info () {
 ref=$($WHICHGIT symbolic-ref HEAD 2>/dev/null) || return
 echo "${ref#refs/heads/}"
}

unpushed () {
  $WHICHGIT cherry -v @{upstream} 2>/dev/null
}

need_push () {
  if [[ $(unpushed) == "" ]]
  then
    echo " "
  else
    echo " with %{$fg_bold[magenta]%}unpushed%{$reset_color%} "
  fi
}

rb_prompt(){
  if $(which rbenv &> /dev/null)
  then
	  echo "%{$fg_bold[yellow]%}$(rbenv version | awk '{print $1}')%{$reset_color%}"
	else
	  echo ""
  fi
}

who_am_i() {
    echo "%{$fg_bold[yellow]%}$(whoami)%{$reset_color%}"
}

# This keeps the number of todos always available the right hand side of my
# command line. I filter it to only count those tagged as "+next", so it's more
# of a motivation to clear out the list.
todo() {
  if $(which todo.sh &> /dev/null)
  then
    num=$(echo $(todo.sh ls +next | wc -l))
    let todos=num-2
    if [ $todos != 0 ]
    then
      echo "$todos"
    else
      echo ""
    fi
  else
    echo ""
  fi
}

directory_name(){
  echo "%{$fg_bold[cyan]%}%1/%\/%{$reset_color%}"
}

export PROMPT=$'\n\e[${DW_FW}C%{$fg_bold[yellow]%}%D%{$reset_color%}\e[${DW_BACK}D$(who_am_i) in $(directory_name) $(git_dirty)$(need_push)\n› '
set_prompt () {
  DW_BACK=0
  (( DW_BACK = ${COLUMNS} - 1 ))
  DW_FW=0
  (( DW_FW = $DW_BACK - 8 ))

  export RPROMPT=$'%{$fg_bold[yellow]%}%t%{$reset_color%}'
}

precmd() {
  title "zsh" "%m" "%55<...<%~"

  set_prompt
}
