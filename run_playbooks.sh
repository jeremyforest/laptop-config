#!/bin/bash

if [[ $1 == "-debug" ]]; then
    echo "Running in debug mode..."
    ansible-playbook -vvv -i localhost, -K local.yml
elif [[ $1 == "-h" || $1 == "--help" ]]; then
    echo "Usage: ./run_playbook.sh [-debug]"
    echo "  -debug     Run playbook in debug mode with verbose -vvv output"
    echo "  (default)  Run playbook in normal mode"
else
    echo "Running in normal mode..."
    ansible-playbook -i localhost, -K local.yml
fi

