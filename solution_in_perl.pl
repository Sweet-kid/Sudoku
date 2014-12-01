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

sub test_is_present_horizontally {
    my $array_ref = [
        [ 1, 2, 3, 4 ],
        [ 5, 6, 7, 8 ],
        [ 9, 10, 11, 12 ],
        [ 13, 14, 15, 16 ]
        ];

    if( is_present_horizontally( 4, $array_ref, 4, 4, 0, 0 ) ) {
        print "4 is present horizontally to (0, 0)\n";
    } else {
        print "4 is not present horizontally to (0, 0)\n";
    }
    if( is_present_horizontally( 4, $array_ref, 4, 4, 1, 1 ) ) {
        print "4 is present horizontally to (1, 1)\n";
    } else {
        print "4 is not present horizontally to (1, 1)\n";
    }
}

sub is_present_horizontally {
    my $number      = shift;
    my $y_lines_ref = shift;
    my $x           = shift;
    my $y           = shift;
    my $i           = shift;
    my $j           = shift;

    my @y_lines     = @$y_lines_ref;
    my $x_array_ref = $y_lines[ $i ];
    my @x_array     = @$x_array_ref;

    if( grep { $_ eq $number } @x_array ) {
        return 1;
    } else {
        return 0;
    }
}
