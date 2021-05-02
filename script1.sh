# Get the distinct list of dates from the files. 
ls logs | sed  's/.log//g' | sed 's/tp//g' |awk '{split($0,a,"_"); print a[1]}' | uniq

