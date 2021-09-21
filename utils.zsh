#!/usr/local/bin/zsh


# terminal
function term() {
    if $# -eq 0
    then
        open -a iterm -n "$PWD"
    else
        open -a iterm -n "$1"
    fi
}


# jupyter
function nb() {
    jupyter nbconvert $1 --to html
}


# youtube-dl
function dl_audio() {
    youtube-dl --extract-audio --audio-format mp3 $1
}


function dl_playlist() {
    youtube-dl -cit --extract-audio --audio-format mp3 $1
}



