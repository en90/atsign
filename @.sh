#!/bin/bash
 
function @()
{
  if [ $? = 127 ]
  then
    PROGRAM=$(history 2 | head -n 1 | tr -s \  \ | cut -f3 -d\  | tr -d '[:space:]')
    PATTERN="/s?bin/$PROGRAM\$"
    SHORT_PATTERN="$PROGRAM"
  elif [ $1 != "" ]
  then
    case "$1" in
      -l*)
        FILE="lib$(echo "$1" | sed 's/^-l//').(so|a)"
        ;;
      *)
        FILE="$1"
    esac
    PATTERN="/$FILE\$"
    SHORT_PATTERN="$FILE"
  fi
 
  BUFFER=$(mktemp)
 
  (
    apt-file -x search "$PATTERN" > "$BUFFER"
 
    COUNT=$(wc -l "$BUFFER" | cut -f1 -d\ )
 
    case $COUNT in
      0)
        echo "$SHORT_PATTERN: no match" 1>&2
        exit 1
        ;;
      1)
        cat "$BUFFER"
        CHOICE=1
        ;;
      *)
        nl "$BUFFER"
        echo -n "> "
        read CHOICE || exit 1
        expr \( "$CHOICE" '>' 0 \) \& \( "$CHOICE" '<=' $COUNT \) >/dev/null || exit 1
        ;;
    esac
 
    PACKAGE=$(sed "$CHOICE!D" "$BUFFER" | cut -d: -f1)
 
    /usr/bin/sudo /usr/bin/aptitude -P install "$PACKAGE"
  )
 
  rm -f "$BUFFER"
}
