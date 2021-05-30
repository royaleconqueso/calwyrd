#! /usr/local/bin/bash

#Quick script because I can't get wyrd to build on openbsd, so this is a poor quality 
#workaround. (c) of the \\quantifier\\consortium\\
#https://github.com/royaleconqueso/calwyrd

tmp_file=$(tempfile 2>/dev/null) || tmp_file=/tmp/calwyrd$$
trap "rm -f $tmp_file" 0 1 2 5 15

rem -w125 -c+1 | dialog --begin 1 1 --progressbox 50 125 --and-widget \
        --begin 5 130 --backtitle "Calendar Option to Replace Wyrd" --date-format '%b %e %Y' --calendar "CALENDAR" 0 0 2> $tmp_file

case $? in
  0)
    echo -n "rem " >> ~/.reminders;
    cat $tmp_file | tr '\n' ' ' >> ~/.reminders;
    echo -n " msg " >> ~/.reminders;
    nano +9999999 ~/.reminders;;
  1)
    echo "Cancel pressed. Exiting...";;
  255)
    echo "Box closed. Exiting...";;
esac

exit

# to give calendar an extra button and then use that button to open a text file to edit .reminders
#       todo | dialog --begin 35 130 --progressbox 10 30 --and-widget \
