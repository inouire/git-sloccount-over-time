# Count lines with sloccount
total_count_line=$(sloccount ./ 2> /dev/null | grep "Total Physical Source Lines of Code (SLOC)" )
IFS='='
read -ra total_count_items <<< "$total_count_line"
total_count=${total_count_items[-1]/,/}
echo "$total_count lines of code detected by sloccount 🧾"
