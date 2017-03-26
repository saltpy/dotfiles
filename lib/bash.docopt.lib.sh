#!/usr/bin/env bash

. "/Users/saltpy/src/dotfiles/lib/bash.core.lib.sh"

function docopt() {
    argstr="${1##*: }"
    argmap=$(Map "opts")
    for key in $argstr;do
        if $(String_contains "$2" "$key");then
            value="0"
        else
            value="1"
        fi
        Map_put $armap $key $value
    done
    echo $argmap
    return 0
}
