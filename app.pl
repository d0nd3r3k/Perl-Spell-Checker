#!/bin/perl

# Author: Donald Derek Haddad
# Description: This program will ask the user to enter a sentence to be checked. 
# The program will then find the misspelled words and return them along with 
# the correct spelling(s).
# Course: Scripting Languages - Lebanese American University
# Theacher: Dr.Georges Khazen
# Date: 14 December 2013

# Strict and Warnings are used to make perl more robust
use strict;
use warnings;

# Module used to compute minimum number out of a set
use List::Util qw(min);

# Levinshetin algorithm to compute distances between two strings
# @accept: String1 and String2
# @return: distance between the 2 strings
sub distance {
    my ($str1, $str2) = @_;
    my @ar1 = split( //, $str1);
    my @ar2 = split( //, $str2);

    my @dist;
    $dist[$_][0] = $_ foreach (0 .. @ar1);
    $dist[0][$_] = $_ foreach (0 .. @ar2);

    foreach my $i (1 .. @ar1){
        foreach my $j (1 .. @ar2){
            my $cost = $ar1[$i - 1] eq $ar2[$j - 1] ? 0 : 1;
    	    $dist[$i][$j] = min(
                            $dist[$i - 1][$j] + 1,
                            $dist[$i][$j - 1] + 1,
                            $dist[$i - 1][$j - 1] + $cost );
        }
    }

    return $dist[@ar1][@ar2];
}

# Open dictionary file
open(my $in,  "<",  "dictionary.txt")  or die "Can't open dictionary.txt: $!";

# Initialize dictionary hash table
my %dict;

while (<$in>) {     
	chomp;
	# assigns each line in turn to $_ and add it to the Hash
	$dict{"$_"}= $_;
}

# Close the buffer when it's done
close $in or die "$in: $!";

# Beginning of spell checker
print "Please enter your text: \n";

# Read Text from the keyboard
my $text=<STDIN>;
chomp $text;

# Transform the text to lower case
$text = lc $text;

# Split text scalar into an array delimited by a space or .
my @text=split(/[. ]+/,$text);
my @spellings;
print "Scanning... \n \n";

# Loop on each word
foreach (@text){

    # Check if word exists in the dictionary hash
	if (!(exists $dict{$_})){
        # Get and store the word and its length
        my $spell = $_;
		my $spell_len = length $spell;
        print $spell . ": ";

        # Searching for similar words 
        foreach(%dict){

            # Compute the difference in length
            my $this_len = length $_;
			my $diff = $spell_len - $this_len;

            # Compute the distances of close length words 
            # this will dramatically improve the performance
            if(abs($diff) <= 1){
                if(distance($_, $spell) <= 1){ print $_ .", "; }
            }            
        }
        print " \n\n";
	}
}
print "Done. \n"