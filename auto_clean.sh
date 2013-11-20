#!/bin/bash - 
#
# Regular clean the specified directory

function clean_dir {
	# $1 - the directory to clean
	# $2 - expire time (day)

	totalnum=$(find $1 -type f | wc -l)

	if [ $totalnum -gt $2 ]; then
		delfile=$(find $1 -mtime +$2 -print)
		for file in ${delfile[*]}; do
			echo $file
			# rm $file
		done
	fi
}


# test case
clean_dir1="/home/wzy/geek/ACM"
clean_dir2="/home/wzy/geek/cracking_the_code_interview"
clean_arr=($clean_dir1 $clean_dir2)
expire_time=56

clean_dir $clean_arr $expire_time
