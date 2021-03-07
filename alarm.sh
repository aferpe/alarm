#!/bin/bash

printf "How long until you need the alarm to go off?\nExamples: 2d, 1h, 30m, 5s\n"

read time

printf "Alarm activated\n"
sleep $time

repeat() {
    n=$1
    shift
    for i in $( seq $n ); do
      $@
    done
}

x=0

while [ $x -lt 5 ]; do
    x=$(( $x + 1 ))
    repeat 4 ffplay -f lavfi -i "sine=frequency=1400:duration=0.1" -autoexit -nodisp -loglevel quiet; sleep 0.65s;
done

date=$(date "+on %A, at %T")

printf "The alarm went off $( echo $date )\n"
