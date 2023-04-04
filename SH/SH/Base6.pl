#!/usr/bin/perl
use v5.32;
use strict;
use warnings;
my @ot=qw(! @ # $ % ^ & * ( ) [ ] { } < > _ + - = . , : ; ? / \ | "" '' ` ~);
my $n=0;
my @bas6=(("A".."Z"),("a".."z"),(0..9),@ot);
foreach (@bas6){
	print $n++.$_." ";
	if($n % 10 == 0){
	print "\n";
	}
}
