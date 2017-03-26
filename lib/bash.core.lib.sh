#!/usr/bin/env bash

function containsMatch() {
    for element in $1;do
        [[ "$element" =~ $2 ]] && return 0;
    done

    return 1
}

function testContainsMatch_ExactMatch() {
    containsMatch "a b c" "b"
    assertTrue "$?"
}

function testContainsMatch_FuzzyMatch() {
    containsMatch "ab bc cd" a*
    assertTrue "$?"
}
