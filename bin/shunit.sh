#!/usr/bin/env bash

function run() {
    . $1
    . "$(dirname "$0")/../lib/shunit2/source/2.1/src/shunit2"
}

run $1
