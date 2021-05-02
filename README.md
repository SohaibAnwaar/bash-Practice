# bash-Practice

A Linux based project that you can complete from your side. 
The solution should be done via a Bash script, utilizing any available tools on a standard Linux system. 
Please find the specifications for the project below: 
Suppose you have a directory with log files that need to be processed sequentially by date. The files are of the format "tp2013.12.13.log", but can also have variations such as "tp2013.12.13_a.log" or "tp2013.12.13_b.log". These variations (called suffixes) are not uniform and may or may not occur on some dates. Write a bash script to do the following: 
    1. Get the distinct list of dates from the files. 
    2. Get the distinct list of suffixes. 
    3. Process the files in ascending date order, but descending suffix order. 
    4. For every date and suffix, check if the file exists and is greater than 0 size. On failure, output an appropriate message 
    5. If above check succeeds, count the number of lines in the file and the number of occurrences of the word "trade ZN" within the file. Output this information to the screen. 
    6. Replace all occurrences of the phase "trade ZN" with "trade ZNZ5" on all lines that appear after a line "issued a trade on ZN". Note that there may be multiple occurrences. 
    7. Now assume that a user will want to run this file with an exclusionary list of dates and suffixes. Allow the user to give a list of dates and suffixes that should be excluded from this processing as a command line parameter set. If the list of dates is equal to the list of distinct dates in the directory then output a message stating that. Similarly for the suffixes. 
You are expected to be able to generate a set of test files to run the script against. Please see the sample file within the folder for steps 5 and 6. 
The script should be written in a single file with comments throughout. Your solution should include a wrapper script that will run your solution as a background process and write any output to "/tmp/interview.log" with appropriate time stamps. The interview.log file can also be placed within the directory of the other log giles. Note that the wrapper script is expected to be relatively simple (e.g. a one liner). 
