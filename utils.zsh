#!/usr/local/bin/zsh


function th() {
    cd $TH
}


function ignore() {
    wget "https://raw.githubusercontent.com/dabideee13/terminal-tools/main/.gitignore"
}


# terminal
function term() {
    if $# -eq 0
    then
        open -a iterm -n "$PWD" 2>/dev/null
    else
        open -a iterm -n "$1" 2>/dev/null
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


function activate() {
    source venv/bin/activate 2>/dev/null ||
    source ../venv/bin/activate 2>/dev/null ||
    source ../../venv/bin/activate
}
