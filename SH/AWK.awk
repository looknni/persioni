#!/usr/bin/awk
# GNU Awk 5.2.1, API 3.2, (GNU MPFR 4.2.0, GNU MP 6.2.1)
BEGIN{

# ARGC=ARGV[ARGIND] CONVFMT=%.6g FILENAME !POSIX:BINMODE 1|2|3 IGNORECASE=0|1 OFMT=%0.6g SUBSEP=\034 FS=" " OFS=" " NF NR FNR RS="\n" ORS="\n" RT=""=$RS
# \t \n \v \r \f %c %d %i %e %E %f %s %nd
# ~ !~ == != && || +
# atan2(x,y) cos(x) exp(x) int(x) log(x) rand() sin(x) sqrt(x) srand(x)
# gsub(regex,sub,string) match(str,regex) split(str,array,regex|SUBSEP) strtonum(str) substr(str,start,n) tolower(str) toupper(str) systime() mktime(datespec) strftime(format,timestamp) and lshift rshift or xor

}{
	if(){}else if(){}else{}
	switch (){case : break;default:break;}
	 ? : 
	while(){}do{}
	for( in ){}
	for(;;){}
	do{ # break continue next exit }while(){}

}
END{
	print
	printf()
}

# awk -v FS=" " -v OFS=" " -v RS="\n" -v ORS="\n" '{}' ; awk 'BEGIN{FS=" ";OFS=" ";RS="\n";ORS="\n"}'
# awk 'NR==3 {print $0}' filename
# echo 0123456789 | awk -v FIELDWIDTHS="3 3 3" '{print (+$1)"."(+$2)"."(+$3)}'
# echo -e "ab \nAB" | awk '/ab/{IGNORECASE=1}'
# awk 'BEGIN {match("a bc def", "de");print RSTART,RLENGTH}'
# echo -e "a5 10 \n4b \n1c \n3d" | awk -v RS='[0-9]+' '{s+=RT}END{print s}'
# awk '{if(FNR == 1){print $0}}' filename filename1
# awk 'BEGIN { print ENVIRON["USER"] }'
# awk 'BEGIN {print index("Hello", "ll")}'
BEGIN {
    cmd = "tr [a-z] [A-Z]"
    print "hello awk" |& cmd
    close(cmd, "to")

    cmd |& getline out
    print out;
    close(cmd);
 }

# grep -nbi --color '' filename # -v, --invert-match -R -i, --ignore-case -c, --count
# awk '!xx[$0]++' = sort|uniq
# sed -n '3,6p' filename | cat -n , head -n 6 filename | tail -n +3 | nl
# ls /bin/ | awk '{xx=$0;if(NR % 5 != 0){ORS=" ";print($xx)}else{print("\n",$xx ,"")}}'
# awk '{printf "%s ", $0}' , sed ':a;N;$!ba;s/\n/ /g' 
