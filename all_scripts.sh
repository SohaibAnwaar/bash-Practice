# Now assume that a user will want to run this file with an exclusionary list of dates and suffixes. Allow the user to give a list of dates and suffixes that should be excluded from this processing as a command line parameter set. If the list of dates is equal to the list of distinct dates in the directory then output a message stating that. Similarly for the suffixes.
# You can run this script from these commands
# Initlize the array first to pass it as command line argument
# arr2=('2013.12.17' '2013.12.16' 'a')
#
# Than Run the script like this
# bash script7.sh "${arr2[@]}"
# bash all_scripts.sh >> interview.log


echo "$(date -Iseconds)"
echo 

declare -a ar=( "$@" )

# Gettting dates from the files
dates=($(ls logs | sed  's/.log//g' | sed 's/tp//g' |awk '{split($0,a,"_"); print a[1]}' | uniq 
))

# Gettting Suffix from the files
sufix=($(ls logs | sed  's/.log//g' | sed 's/tp//g' |awk '{split($0,a,"_"); print a[2]}' | uniq
))


# Concating dates and suffix arrays
dates_suffix=( "${dates[@]}" "${sufix[@]}" )


# Function to get the similar elements from 2 arrays
similar(){
  awk 'BEGIN{RS=ORS=" "}
       {NR==FNR?a[$0]++:a[$0]--}
       END{for(k in a)if(!a[k])print k}' <(echo -n "${!1}") <(echo -n "${!2}")
}


# Fucntion to get 2 different elements from array
diff(){
  awk 'BEGIN{RS=ORS=" "}
       {NR==FNR?a[$0]++:a[$0]--}
       END{for(k in a)if(a[k])print k}' <(echo -n "${!1}") <(echo -n "${!2}")
}

# Printing the results
echo 
Array3=($(diff dates_suffix[@] ar[@]))
echo "Not Matched Dates and suffix " ${Array3[@]}

echo 

Array4=($(similar dates_suffix[@] ar[@]))
echo "Matched Dates and suffix " ${Array4[@]}

# Removing Old Results
rm -r processed_logs
mkdir processed_logs

# copying only files to the processed Logs
for files in "${Array3[@]}"
do
   echo $files
   echo "here"
   ls logs |grep -i $files | xargs -I {} cp logs/{} ./processed_logs
done



# Get the distinct list of dates from the files. 
ls processed_logs | sed  's/.log//g' | sed 's/tp//g' |awk '{split($0,a,"_"); print a[1]}' | uniq

# Get the distinct list of suffixes
ls processed_logs | sed  's/.log//g' | sed 's/tp//g' |awk '{split($0,a,"_"); print a[2]}' | uniq

# Process the files in ascending date order, but descending suffix order. 
ls processed_logs/ | sed  's/.log//g' | sed 's/tp//g' |awk '{split($0,a,"_"); print a[1], a[2]} ' 

# For every date and suffix, check if the file exists and is greater than 0 size. On failure, output an appropriate message

find processed_logs/ -size 0k | xargs -I {} echo These files are of 0kb {}

# If above check succeeds, count the number of lines in the file and the number of occurrences of the word "trade ZN" within the file. Output this information to the screen. 

grep -rci 'trade ZN' | grep processed_logs/


mkdir ./processed_logs/processed/
#Replace all occurrences of the phase "trade ZN" with "trade ZNZ5" on all lines that appear after a line "issued a trade on ZN". Note that there may be multiple occurrences
ls processed_logs/ |while read n;do cat processed_logs/$n | perl -pe 's/\n/___/g' | perl -pe 's/issued a trade on ZN___trade ZN/issued a trade on ZN___trade ZNZ4/g' | perl -pe 's/___/\n/g' >> ./processed_logs/processed/$n;done 

mkdir -p processed
mv -f ./processed_logs/processed/* ./processed
rm -r processed_logs
rm processed/processed






