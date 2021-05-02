#Replace all occurrences of the phase "trade ZN" with "trade ZNZ5" on all lines that appear after a line "issued a trade on ZN". Note that there may be multiple occurrences
find logs/ -type f |xargs -I {}  sed -i '/issued a trade on ZN/{n;s/trade ZN/trade ZNZ5/g}' {} 

