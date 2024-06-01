#!/usr/bin/env perl

# perl [-a],"-F'',@F" [-e],'' [-l],"$/=\0,$\=$/" [-p],"print" [-n],"not print"
# (@,%)=@_ @|%{[]}
# SCALAR ARRAY HASH CODE REF GLOB VLALUE FORMAT IO VSTRING REGEXP
use,require strict;
use warnings;
use utf8;
binmode STDOUT, ":encoding(UTF-8)";
binmode STDERR, ":encoding(UTF-8)";
$var =<< "EOF";
# <STDIN> <STDOUT> <STDERR> <> __DATA__ __END__ __FILE__ ___LINE__ __PACKAGE__ __DIE__ __WARN__
## perl -ne 'print if /pattern/' file
## perl -pi -e 's/pattern/string/' file
#GENERAL, $_ @_ $",(out &|@) $$ $0 $( $) $< $> $; sort():$a,$b $] $^F %ENV @F,"awk,NF" @INC $^I @ISA $^M $^O %SIG $^T $^V $^X ($` $& $',qr// l m r)
#ERROR, $@ $? %! $! ${^WARNING_BITS} $^W $^S $^E ${^CHILD_ERROR_NATIVE}
#FORMATS, $^A $^L $% $- $: $= $^ $~
#FILEHANDLES, $ARGV @ARGV AEGV ARGVOUT $,,(out &|@) $.,"awk,NR" $/,"awk,RS" $\,"awk,ORS" $| ${^LAST_FH}
#STRING, x . eq ne le ge lt gt cmp , ++
#NUMBER, + - * / % == != <= >= > < cmp,<=>:-1|0|1 &&,and ||,or !,not & | ^ ++ -- ** += *= >> << ~ ... ->
#FILE, <,r <,w >> +<,r+ +>,w+ +>>,a+
$var="String" | Number @array=(.. , .. , ..) %hash=(.. , .. , .. , ..) &function
foreach $key|$value (keys|values %hash){}
# next last continue goto
if (Expression) {Code Segment} elsif (Expression) {Code Segment} else {Code Segment}
while(($key,$value)=each %hash){}
foreach (values %main::){$_}
EOF

package Packagename;
{ sub new {my $structname = shift; my $self = {}; return bless $self, $structname;}
sub DESTROY {Packagename::DESTROY caller;}
sub Namemethod {Packagename::Namemethod caller;}
}
{ package SubPackagename;
our @ISA = qw(Packagename); | use base qw(Packagename); | use parent qw(Packagename);
sub new {my $substructname = shift; my $self = Packagename->new; return bless $self , $substructname;}
sub DESTROY {Subpackagename::DESTROY caller;}
sub Namemethod {my $self = shift; $self->SUPER::Namemethod;}
}
package main;
$nameObject = Packagename->new();$nameObject->Namemethod();{}

use DBI; use strict;
DBI->connect("DBI:$drivername:database=$databasename:$ipaddr", $userid, $password) or die $DBI::errstr [commit or die $DBI::errstr;]->prepare("SELECT * FROM ...")->execute() or die $DBI::errstr;
while ( DBI->connect("DBI:$drivername:database=$databasename:$ipaddr", $userid, $password)->prepare("SELECT * FROM ...")->fetchrow_array() ){join('\t', ...);}
DBI->connect("DBI:$drivername:database=$databasename:$ipaddr", $userid, $password)->prepare("SELECT * FROM ...")->finish();
# ->disconnect();
do('UPDATE | INSERT | DELETE command');

use MIME::Lite;
MIME::Lite->new(From=>$1,To=>$2,CC=>$3,Subject=>$4,Data=>$5,Type=>'multipart/mixed')->attach(Type=>$6,Path=>$7,Filename=>$8,Data=>$9,Disposition=>$10)|->send;

use strict;use Socket;
socket(SOCKET, PF_INET, SOCK_STREAM, getprotobyname('tcp')) or die "$!\n";
setsockopt(SOCKET, SOL_SOCKET, SO_REUSEADDR, 1) or die "$!\n";
bind(SOCKET, pack_sockaddr_in($port, inet_aton("$ip"))) or die "$port\n";
listen(SOCKET, 5) or die "$!\n";
while(accept(NEW_SOCKET, SOCKET)){gethostbyaddr(accept(NEW_SOCKET,SOCKET), AF_INET);close NEW_SOCKET;}
use strict;use Socket;
socket(SOCKET,PF_INET,SOCK_STREAM,(getprotobyname('tcp'))[2]) or die "$!\n";
connect(SOCKET,pack_sockaddr_in($port,inet_aton($ip))) or die "$port\n";
while(<SOCKET>){...}
close SOCKET or die "$!\n";

## ALL\u
perl -nle 'print uc' file
perl -ple '$_ = uc' file
perl -nle 'print "\U$_"' file
## all\l
perl -nle 'print lc' file
perl -ple '$_ = lc' file
perl -nle 'print "\L$_"' file
## First\u
perl -nle 'print lcfirst' file
perl -lpe '$_ = ucfirst' file
perl -lne 'print \u\L$_' file
perl -ple 's/(\w+)/\u$1/g' file

## perl -MMIME::Base64 -0600 -ne 'print encode_base64($_)' file
