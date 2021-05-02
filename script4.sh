# For every date and suffix, check if the file exists and is greater than 0 size. On failure, output an appropriate message

find logs/ -size 0k | xargs -I {} echo These files are of 0kb {}
