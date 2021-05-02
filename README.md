# bash-Practice

bash script to do the following: 

    1. Get the distinct list of dates from the files. 
    2. Get the distinct list of suffixes. 
    3. Process the files in ascending date order, but descending suffix order. 
    4. For every date and suffix, check if the file exists and is greater than 0 size. On failure, output an appropriate message 
    5. If above check succeeds, count the number of lines in the file and the number of occurrences of the word "trade ZN" within the file. Output this information to the screen. 
    6. Replace all occurrences of the phase "trade ZN" with "trade ZNZ5" on all lines that appear after a line "issued a trade on ZN". Note that there may be multiple occurrences. 
    7. Now assume that a user will want to run this file with an exclusionary list of dates and suffixes. Allow the user to give a list of dates and suffixes that should be excluded from this processing as a command line parameter set. If the list of dates is equal to the list of distinct dates in the directory then output a message stating that. Similarly for the suffixes. 

