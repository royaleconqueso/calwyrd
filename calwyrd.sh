#! /usr/local/bin/bash

#Quick script because I can't get wyrd to build on openbsd. It's written in OCaml, and I can't seem to get it to build.
#So this is a poor quality workaround. (c) of the \\quantifier\\consortium\\
#https://github.com/royaleconqueso/calwyrd
#https://unix.stackexchange.com/questions/181937/how-create-a-temporary-file-in-shell-script
#https://linuxcommand.org/lc3_adv_dialog.php
tmp_file=$(tempfile 2>/dev/null) || tmp_file=/tmp/calwyrd$$
trap "rm -f $tmp_file" 0 1 2 5 15

dialog --date-format '%b %e %Y' --calendar "CALENDAR" 0 0 2> $tmp_file
echo -n "rem " >> ~/.remindersbincalendaring.rem
cat $tmp_file | tr '\n' ' ' >> ~/.remindersbincalendaring.rem
echo -n " msg " >> ~/.remindersbincalendaring.rem
nano +9999999 ~/.remindersbincalendaring.rem
exit
