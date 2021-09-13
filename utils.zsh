#!/usr/local/bin/zsh


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


# search 
function find_helper() {
    ARRAY=()
    for i in $(find ./ $1 $2)
    do
        ARRAY+=$PWD${i#"./"}"\n"
    done
    echo $ARRAY
}


function find_extension() {
    echo "$(find_helper -iname $1)"
}


function find_pattern() {
    STRING='*'$1'*'
    find_extension $STRING
}


function search() {
    if { echo $1 | grep -q '*' }
        then
            find_extension $1
    else 
        find_pattern $1
    fi
}
