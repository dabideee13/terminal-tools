#!/usr/local/bin/zsh


function view_project() {
}


function remove_project() {
}


function add_project() {
    PROJECT_FILE="$HOME/Tools/.projects"
    if { cat $PROJECT_FILE | grep $1 }
    then
        echo "Project \"$1\" already exists."
        echo "Rename project name or replace existing project."
    else
        echo $1 >> $PROJECT_FILE
        echo "Project \"$1\" successfully added."
    fi

    # TODO: Add date first created
    # TODO: Add date modified 
    # TODO: Add logs
}


function start_project() {

    # Create remote repo or local only
    if [[ "$2" == "remote" ]]
    then
        gh repo create $2
    else
        mkdir "$1"
    fi
    
    cd "$1"

    # Check if .gitignore exists
    if [[ -f "$PWD/.gitignore" ]]
    then
        :
    else
        {
            wget "https://raw.githubusercontent.com/dabideee13/terminal-tools/main/.gitignore" ||
                cp .gitignore > "$1""/.gitignore"
        }
    fi

    # Initialize project
    git init
    virtualenv venv
    source "venv/bin/activate"

    # First level
    FDIR=("src" "data" "tests" "notebooks" "reports")
    FFILE=("requirements.txt" "setup.py" "README.md")
    for d in $FDIR; do mkdir $d; done
    for f in $FFILE; do touch $f; done

    
    # Second level
    SDIR=("data/raw" "data/processed" "reports/figures")
    SFILE=("src/main.py" "src/utils.py")
    for d in $SDIR; do mkdir $d; done
    for f in $SFILE; do touch $f; done

    # Add to project list
    echo "$1" >> "$HOME/Tools/.projects"

    tree -I "venv"
}

