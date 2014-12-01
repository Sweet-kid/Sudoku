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


my $solutions_ref = initialize_three_d_array_of_solutions( $x, $y );

sub prompt {
    my $message = shift;
    print "\n$message : ";
    my $var = <STDIN>;
    $var =~ s/\s//;
    return $var;
}

sub initialize_three_d_array_of_solutions {
    my $x = shift;
    my $y = shift;
    my @y_lines;

    for my $i ( 0 .. $y - 1 ) {
        my @x_lines;
        for my $j ( 0 .. $x - 1 ) {
            $x_lines[ $j ] = [ 1 .. 9 ];
        }
        $y_lines[ $i ] = \@x_lines;
    }
    return \@y_lines;
}
