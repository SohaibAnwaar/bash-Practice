# Get the distinct list of suffixes
ls logs | sed  's/.log//g' | sed 's/tp//g' |awk '{split($0,a,"_"); print a[2]}' | uniq

