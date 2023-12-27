#!/bin/bash
# color_func.sh
# colortest as a function
# bash function to change text colors using html color codes
# pass value of hex color code minus the '#'

color_func () {
    HEXCODE=$1
    # make uppercase
    HEXCODE="$(echo $HEXCODE | tr '[:lower:]' '[:upper:]')"
    x="$(echo $HEXCODE | cut -c-2)"
    y="$(echo $HEXCODE | cut -c3-4)"
    z="$(echo $HEXCODE | cut -c5-6)"

    # convert to rgb values
    r="$(echo "ibase=16; $x" | bc)"
    g="$(echo "ibase=16; $y" | bc)"
    b="$(echo "ibase=16; $z" | bc)"

    # assign rgb colors to $color
    color="\e[38;2;"$r";"$g";"$b"m"
    echo -e "$color"
}

color_reset () {
    # reset colors 
    reset="\e[m"
    echo -e "$reset"
}

# invoke color_func and assign HTML color code
color_func 75fffd
echo "Hello World "
# invoke color_reset to reset text colors.
color_reset
echo "Hello World "
exit 0
