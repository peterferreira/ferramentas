#!/bin/bash
# Autor: Peter Ferreira <peterkid@gmail.com>
# Date: 2018-01-16 YYYY-MM-DD
# What to do: Download and run a python script to test internet speed
# The python script is written by Matt Martz
# License: GPL v3

testar(){
	./speedtest.py
}

baixar(){
	wget https://raw.githubusercontent.com/sivel/speedtest-cli/master/speedtest.py
        chmod +x speedtest.py
}

if [ -e speedtest.py ]
then
	testar
else
	baixar
	testar
fi

