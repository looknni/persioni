#!/usr/bin/perl
use strict;
print "help: perl $0 '\@ARGV[0]'\n\@ARGV[0],'string'\n\n";
=pod
This is perl 5, version 36, subversion 0 (v5.36.0) built for
=cut
my @dicsk=('A'..'Z','a'..'z',0..99,'AA'..'ZZ','aA'..'zZ','Aa'..'Zz','aa'..'zz');
foreach (100..41008){
push @dicsk,$_;
}
foreach ('AAA'..'ZZZ'){
push @dicsk,$_;
}
foreach (41009..50018){
push @dicsk,$_;
}
foreach ('AAa'..'ZZz'){
push @dicsk,$_;
}
foreach (50019..61008){
push @dicsk,$_;
}
foreach ('AaA'..'ZzZ'){
push @dicsk,$_;
}
foreach (61009..70028){
push @dicsk,$_;
}
foreach ('aAA'..'zZZ'){
push @dicsk,$_;
}
foreach (70029..80038){
push @dicsk,$_;
}
foreach ('aaA'..'zzZ'){
push @dicsk,$_;
}
foreach (80039..90018){
push @dicsk,$_;
}
foreach ('aAa'..'zZz'){
push @dicsk,$_;
}
foreach (90019..100108){
push @dicsk,$_;
}
foreach ('Aaa'..'Zzz'){
push @dicsk,$_;
}
foreach (100109..110098){
push @dicsk,$_;
}
foreach ('aaa'..'zzz'){
push @dicsk,$_;
}
foreach (110099..125212){
push @dicsk,$_;
}
my %codek;
for($a=0;$a<scalar(@dicsk);$a++){
        $codek{$dicsk[$a]} = "$a";
}
my @numk=split(" ",@ARGV[0]);
foreach (@numk){
        print @dicsk[$_]." ";
}
print "\n".`echo "$ARGV[0]" |md5sum`;
my $cc;
foreach (@numk){
        $cc .= %codek{$_}." ";
}
print $cc."\n";
