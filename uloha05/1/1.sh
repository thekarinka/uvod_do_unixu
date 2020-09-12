#!/bin/sh

find /etc/. -d 1 -ls | sort -k 7 -r | head -n 1
