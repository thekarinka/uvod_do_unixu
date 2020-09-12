#!/bin/sh

adresa=127.0.0.1



if [ "$server" = "1" ]; then
        ./priprava.sh | tee >(nc -u $adresa 4321)
else
        nc $adresa 4321
fi
