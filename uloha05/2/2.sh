#!/bin/sh

find /var/. -ls | sort -k 7 -r | head -n 1
