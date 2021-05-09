#! /usr/local/bin/bash

#Quick script because I can't get wyrd to build on openbsd, so this is a poor quality 
#workaround. (c) of the \\quantifier\\consortium\\
#https://github.com/royaleconqueso/
#https://unix.stackexchange.com/questions/181937/how-create-a-temporary-file-in-shell-script
#https://linuxcommand.org/lc3_adv_dialog.php
tmp_file=$(tempfile 2>/dev/null) || tmp_file=/tmp/calwyrd$$
trap "rm -f $tmp_file" 0 1 2 5 15

rem -w125 -c+1 | dialog --begin 1 1 --progressbox 50 125 --and-widget \
        --begin 5 130 --backtitle "Calendar Option to Replace Wyrd" --date-format '%b %e %Y' --calendar "CALENDAR" 0 0 2> $tmp_file
echo -n "rem " >> ~/.remindersbincalendaring.rem
cat $tmp_file | tr '\n' ' ' >> ~/.remindersbincalendaring.rem
echo -n " msg " >> ~/.remindersbincalendaring.rem
nano +9999999 ~/.remindersbincalendaring.rem
exit

#dialog --backtitle Calendar --title calendar --extra-button --extra-label "Extra step" --ok-label "Ok computer" --exit-label "Bye bye" --calendar "Please select a date" 0 0
#https://www.nnc3.com/mags/LM10/Magazine/Archive/2010/114/064-070_dialog/article.html
#https://linuxcommand.org/lc3_adv_dialog.php
# to give calendar an extra button and then use that button to open a text file to edit .reminders
