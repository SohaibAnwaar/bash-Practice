# If above check succeeds, count the number of lines in the file and the number of occurrences of the word "trade ZN" within the file. Output this information to the screen. 

grep -rci 'trade ZN' | grep logs/
