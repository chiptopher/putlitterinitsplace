#!/bin/bash

FILES=$(ls | grep .lua)

if [ "$FILES" != "" ]; then
    echo "TESTS FAILED (0/1)"
else
    echo "TEST PASSED (1/1)"
fi


