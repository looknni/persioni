#!/usr/bin/perl
use strict;
use warnings;
my @xase=('a'..'z','A'..'Z',0..9,'/','=');
foreach (@xase){
print $_." ".`echo $_|md5sum|base32`;
print `echo $_|md5sum|base64`;
print `echo $_|md5sum|base32|base64`;
print `echo $_|md5sum|base64|base32`;
}
