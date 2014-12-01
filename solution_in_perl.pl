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

sub test_is_present_vertically {
    my $array_ref = [
        [ 1, 2, 3, 4 ],
        [ 5, 6, 7, 8 ],
        [ 9, 10, 11, 12 ],
        [ 13, 14, 15, 16 ]
        ];

    if( is_present_vertically( 4, $array_ref, 4, 4, 3, 3 ) ) {
        print "4 is present vertically to (3, 3)\n";
    } else {
        print "4 is not present vertically to (3, 3)\n";
    }
    if( is_present_vertically( 4, $array_ref, 4, 4, 2, 2 ) ) {
        print "4 is present vertically to (2, 2)\n";
    } else {
        print "4 is not present vertically to (2, 2)\n";
    }
}

sub is_present_vertically {
    my $number      = shift;
    my $y_lines_ref = shift;
    my $x           = shift;
    my $y           = shift;
    my $i           = shift;
    my $j           = shift;

    my @y_lines     = @$y_lines_ref;

    for my $index( 0 .. $y - 1 ) {
        if( $y_lines[ $index ]->[ $j ] eq $number ) {
            return 1;
        }
    }
    return 0;
}

sub test_is_present_in_the_block_of_3 {
    my $array_ref = [
        [  1,  2,  3,  4,  5,  6 ],
        [  7,  8,  9, 10, 11, 12 ],
        [ 13, 14, 15, 16, 17, 18 ],
        [ 19, 20, 21, 22, 23, 24 ],
        [ 25, 26, 27, 28, 29, 30 ],
        [ 31, 32, 33, 34, 35, 36 ]
        ];

    if( is_present_in_next_3_col_row( 4, $array_ref, 6, 6, 4, 2 ) ) {
        print "4 is present in the block of 3, co-ordinates(4, 2)\n";
    } else {
        print "4 is not present in the block of 3, co-ordinates(4, 2)\n";
    }
    if( is_present_in_next_3_col_row( 4, $array_ref, 6, 6, 2, 2 ) ) {
        print "4 is present in the block of 3, co-ordinates(2, 2)\n";
    } else {
        print "4 is not present in the block of 3, co-ordinates(2, 2)\n";
    }
}

sub is_present_in_the_block_of_3 {
    my $number      = shift;
    my $y_lines_ref = shift;
    my $x           = shift;
    my $y           = shift;
    my $i           = shift;
    my $j           = shift;

    my @y_lines = @$y_lines_ref;

    my $modulo_x = $j % 3;
    my $modulo_y = $i % 3;

    for my $index_y( 0 .. 2 ) {
        for my $index_x( 0 .. 2 ) {
            my $x_lines_ref = $y_lines[ $index_y + $i - $modulo_y ];
            my @x_lines     = @$x_lines_ref;
            my $element = $x_lines[ $index_x + $j - $modulo_x ];
            if( $element eq $number ) {
                return 1;
            }
        }
    }

    return 0;
}
