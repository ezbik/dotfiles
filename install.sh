#!/bin/bash
PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
# vim: filetype=bash


rsync -av ./ ~/ --exclude .git --exclude README.md --exclude install.sh

