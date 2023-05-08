#!/usr/bin/env zsh
#

hash -d p="$HOME/projects"
hash -d dl="$HOME/Downloads"
hash -d docs="$HOME/Documents"

hash -d lumin="$HOME/projects/lumin"

func sshlsp() {
    ssh -oUserKnownHostsFile=/dev/null -oStrictHostKeyChecking=no "$@"
}

func scplsp() {
    scp -oUserKnownHostsFile=/dev/null -oStrictHostKeyChecking=no "$@"
}
