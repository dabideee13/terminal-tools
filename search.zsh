#!/usr/local/bin/zsh

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
