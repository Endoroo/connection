#!/bin/bash
fusermount -uz $(find $HOME/mnt/* -maxdepth 0 -type d)
#rm -f $HOME/mnt/*
