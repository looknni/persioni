#!/usr/bin/perl
use strict;
print "help: perl $0 '\@ARGV[0]'\n\@ARGV[0],'string'\n\n";
=pod
This is perl 5, version 36, subversion 0 (v5.36.0) built for
=cut
my @dicsk=('A'..'Z','a'..'z',0..99);
my %codek;
for($a=0;$a<scalar(@dicsk);$a++){
        $codek{$dicsk[$a]} = "$a";
}
my @numk=split(" ",@ARGV[0]);
foreach (@numk){
        print @dicsk[$_];
}
print "\n.........\n";
my $cc;
foreach (@numk){
        $cc .= %codek{$_}." ";
}
print $cc;
