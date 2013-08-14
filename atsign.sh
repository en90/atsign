#!/bin/bash
 
function atsign()
{
  if [ $? = 127 ]
  then
    local PROGRAM=$(history 2 | head -n 1 | tr -s \  \ | cut -f3 -d\  | tr -d '[:space:]')
    local PATTERN="/s?bin/$PROGRAM\$"
    local SHORT_PATTERN="$PROGRAM"
  elif [ $1 != "" ]
  then
    case "$1" in
      -l*)
        local FILE="lib$(echo "$1" | sed 's/^-l//').(so|a)"
        ;;
      *)
        local FILE="$1"
    esac
    local PATTERN="/$FILE\$"
    local SHORT_PATTERN="$FILE"
  fi
 
  local BUFFER=$(mktemp)
 
  (
    apt-file -x search "$PATTERN" > "$BUFFER"
 
    local COUNT=$(wc -l "$BUFFER" | cut -f1 -d\ )
 
    case $COUNT in
      0)
        echo "$SHORT_PATTERN: no match" 1>&2
        exit 1
        ;;
      1)
        cat "$BUFFER"
        local CHOICE=1
        ;;
      *)
        nl "$BUFFER"
        echo -n "> "
        read CHOICE || exit 1
        expr \( "$CHOICE" '>' 0 \) \& \( "$CHOICE" '<=' $COUNT \) >/dev/null || exit 1
        ;;
    esac
 
    local PACKAGE=$(sed "$CHOICE!D" "$BUFFER" | cut -d: -f1)
 
    /usr/bin/sudo /usr/bin/aptitude -P install "$PACKAGE"
  )
 
  rm -f "$BUFFER"
}

alias @=atsign
