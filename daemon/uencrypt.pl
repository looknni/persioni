#!/usr/bin/perl
use strict;
print "help: perl $0 '\@ARGV[0]'\n\@ARGV[0],'string'\n\n";
=pod
This is perl 5, version 36, subversion 0 (v5.36.0) built for
=cut
my @dicsk=('A'..'Z','a'..'z',0..99,'AA'..'ZZ','aA'..'zZ','Aa'..'Zz','aa'..'zz','.');
foreach (100..999){
push @dicsk,$_;
}
foreach ('aaa'..'zzz'){
push @dicsk,$_;
}
my %codek;
for($a=0;$a<scalar(@dicsk);$a++){
        $codek{$dicsk[$a]} = "$a";
}
my @numk=split(" ",@ARGV[0]);
foreach (@numk){
	if(int($_) > 145404){
&spw($_,@dicsk);
print ". ";
	}elsif($_ =~ /^[a-zA-Z].*$/){
my @si=split("",$_);
foreach (@si){
	print @dicsk[ord("$_")]." ";
}
	}else{
print @dicsk[$_]." ";
}
}
print "\n".`echo "$ARGV[0]" |md5sum`;
my $cc;
foreach (@numk){
	if($_ =~ /^[a-zA-Z]{3}[a-zA-Z].*$/){
&spp($_,%codek);
	}
	if(int($_) > 999){
&spp($_,%codek);
print ". ";
	}
        $cc .= %codek{$_}." ";
}
print $cc."\n";
sub spp{
my @ww=split("",shift);
my %cc=@_;
foreach (@ww){
print %cc{$_}." ";
}}
sub spw{
my @we=split("",shift);
my @cw=@_;
foreach (@we){
print @cw[$_]." ";
}}
