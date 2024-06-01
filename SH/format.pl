#!/usr/bin/perl
use v5.32;
#use warnings;
use strict;
use experimental 'switch';
given($ARGV[0]){
	#when(){}
        default {print "help: perl $0 \$ARGV[0] \$ARGV[1]\n\$ARGV[0],File [\$ARGV[1]],-\n";}
}
unless(-f $ARGV[0]){
	exit;
}
if(defined $ARGV[1]){
        $ARGV[1]="-";
}
my $nfm=0;
my $maxnf=0;
my @sumnf=`awk '{print NF}' $ARGV[0]`;
my @maxx;my @nf;
for (@sumnf){
	if($_ > $maxnf){
	$maxnf=$_;
	}
}
for (1..$maxnf){
my @maxs=`awk '{print length(\$$_)}' $ARGV[0]`;
for (@maxs){
	if($_ > $nfm){
	$nfm=$_;
	}
}
$nfm=~s/\n//;
$nfm +=1;
push(@maxx,$nfm);
$nfm=0;
}
open(XIN,"<$ARGV[0]") or die "$!";
while(<XIN>){
	@nf=split;
	my $nnf=$maxnf-1;
	my $aaa=&stra($nnf,@maxx);
printf("$aaa\n",@nf) or die "$!"; 
}
close XIN;
sub stra{
	my $ff;
	my $num=shift;
	my @nn=@_;
	for (0..$num){
	$ff .= "%${ARGV[1]}${nn[$_]}s";
	}
	return $ff;
}
