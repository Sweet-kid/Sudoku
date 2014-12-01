#!/usr/bin/env perl

use strict;
use warnings;

my $x = prompt("Enter x co-ordinate");
my $y = prompt("Enter y co-ordinate");

my @y_lines;

for my $i( 0 .. $x - 1 ) {
    my @x_lines;
    for my $j ( 0 .. $y - 1 ) {
	$x_lines[ $j ] = prompt("Enter the value for ($i, $j )");
    }
    $y_lines[ $i ] = \@x_lines;
}

sub prompt {
    my $message = shift;
    print "\n$message : ";
    my $var = <STDIN>;
    $var =~ s/\s//;
    return $var;
}
