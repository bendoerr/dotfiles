alias -s com="open"
alias -s html="open"
alias -s ps="open"
alias -s java="vim"

alias die="kill -s KILL"
alias psa="ps aux"
alias psf="ps aux | grep"
alias pss="ps -xr -o \"pid,%cpu,%mem,time,command\" | more -S "

alias clipfile='xclip -selection clipboard < '

hash -d p=$HOME/projects
