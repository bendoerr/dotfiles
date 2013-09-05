bindkey -v

# Home and End Key
bindkey "^[[1~" beginning-of-line
bindkey "^[[4~" end-of-line

# make search up and down work, so partially type and hit up/down to find relevant stuff
bindkey '^[[A' up-line-or-search
bindkey '^[[B' down-line-or-search
bindkey ' ' magic-space    # also do history expansion on space