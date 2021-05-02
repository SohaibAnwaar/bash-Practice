# Process the files in ascending date order, but descending suffix order. 
ls logs/ | sed  's/.log//g' | sed 's/tp//g' |awk '{split($0,a,"_"); print a[1], a[2]} ' 
