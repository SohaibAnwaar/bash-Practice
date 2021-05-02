# You can run this script from these commands
# Initlize the array first to pass it as command line argument
# arr2=('2013.12.17' '2013.12.16' 'a')
#
# Than Run the script like this
# bash script7.sh "${arr2[@]}"



# Now assume that a user will want to run this file with an exclusionary list of dates and suffixes. Allow the user to give a list of dates and suffixes that should be excluded from this processing as a command line parameter set. If the list of dates is equal to the list of distinct dates in the directory then output a message stating that. Similarly for the suffixes.

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


