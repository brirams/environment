#!/bin/bash

find . -type f -exec grep -nH -e  $@ {} +

