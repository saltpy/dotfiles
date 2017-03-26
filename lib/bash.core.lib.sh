#!/usr/bin/env bash

function containsMatch() {
    for element in $1;do
        test "$element" == "$2" && return 0;
    done

    return 1
}

function testContainsMatch() {
    containsMatch "a b c" "b"
    assertTrue "$?"
}
