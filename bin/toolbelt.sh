#!/usr/bin/env bash

VERSION=1

. "$(dirname "$0")/../lib/bash.core.lib.sh"

function usage() {
    echo "toolbelt.sh v$VERSION"
    echo "Usage:"
    echo "  create project <name>"
    return 0
}

function create() {
    declare type $1
    declare -a args $2
    declare -a kwargs $3

    case "$type" in
        "project")
            if containsMatch "${kwargs[@]}" \-\-parent\=*;then
                mkdir -p "$(kwargValue "${kwargs[@]}" "--parent")/${args[0]}"
                cd "$(kwargValue "${kwargs[@]}" "--parent")/${args[0]}" || exit 1
            else
                mkdir "${args[0]}" > /dev/null
                cd "${args[0]}" > /dev/null || exit 1
            fi
            git init > /dev/null
            echo "# ${args[1]}" > README.md
            git add README.md
            for folder in "bin src env doc local lib";do
                mkdir -p "$folder" > /dev/null
                touch "$folder/.gitkeep"
                echo "# ${args[1]}/$folder" > "$folder/README.md"
                git add "$folder/.gitkeep" "$folder/README.md"
            done
            git commit -m "Initial commit"
            echo "local" > .gitignore
            git add .
            git commit -m "Ignore local folder files"
            cd - > /dev/null || exit 1
            ;;
        *)
            ;;
    esac
}

while [ "$#" -gt 0 ];do
    case "$1" in
        "create")
            shift
            exit "$(create "$1" "$(getargs "$#")" "$(getkwargs "$#")")"
            ;;
        *)
            usage
            exit 1
            ;;
    esac
    shift
done

usage
exit 1
