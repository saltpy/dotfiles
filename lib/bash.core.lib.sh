#!/usr/bin/env bash

function String_contains() {
    for element in $1;do
        [[ "$element" =~ $2 ]] && return 0;
    done

    return 1
}

function testString_Contains_ExactMatch() {
    String_contains "a b c" "b"
    assertTrue "$?"
}

function testString_Contains_FuzzyMatch() {
    String_contains "ab bc cd" a*
    assertTrue "$?"
}

function Entry_getKey() {
    String_contains "$1" "=" || return 1
    echo "${1%=*}"
    return 0
}

function testEntry_GetKey() {
    assertEquals "a" "$(Entry_getKey "a=b")"
    assertTrue "$?"
}

function Entry_getValue() {
    String_contains "$1" "=" || return 1
    echo "${1##*=}"
    return 0
}

function testEntry_GetValue() {
    assertEquals "b" "$(Entry_getValue "a=b")"
    assertTrue "$?"
}

function testEntry_InvalidEntry() {
    Entry_getKey "abc"
    assertFalse "$?"
    Entry_getValue "abc"
    assertFalse "$?"
}

function Map() {
    echo "<!-- MAP $1 -->"
    return 0
}

function Map_hasKey() {
    test "$1" = "" && return 1

    String_contains "$2" ^"$key"=*

    return "$?"
}

function testMap_HasKey_EmptyKey() {
    Map_hasKey "a=b c=d" ""
    assertFalse "$?"
}

function testMap_HasKey_MatchFound() {
    Map_hasKey "a=b c=d e=f" "c"
    assertTrue "$?"
}

function Map_getValue() {
    Map_hasKey "$1" "$2" || return 1
    
    for entry in $1;do
        key=$(Entry_getKey "$entry")
        value=$(Entry_getValue "$entry")
        if [ "$key" = "$2" ];then
            echo "$value"
            return 0
        fi
    done

    return 1
}

function testMap_GetValue() {
    assertEquals "d" "$(Map_getValue "a=b c=d e=f" "c")"
    assertTrue "$?"
}
