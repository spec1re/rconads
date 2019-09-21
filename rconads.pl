#!/usr/bin/env perl

use warnings;
use strict;
use Net::RCON;
use Fcntl qw( SEEK_SET );

print "\n";
print "Ctrl + C to exit.", "\n";
print "\n";

my $rcon = Net::RCON->new({
        host => "127.0.0.1",
        port => "27015",
        password => "YOUR_PASSWD_HERE"
});

my $qfn = 'rconads.cfg';
my $sec = '60';

open(my $fh, '< :encoding(UTF-8)', $qfn) or die("Can't open \"$qfn\": $!\n");

while (1) {
   while (<$fh>) {
	sleep $sec;
	print $rcon->send("say $_");
   }
   seek($fh, 0, SEEK_SET);
} 


