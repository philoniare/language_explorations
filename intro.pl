# Notes on perl
# Author: philoniare
# Last Updated: 1/31/2016

## I needed to learn some perl to make an IA for DuckDuckGo

## Some background on perl:
# Perl is the father of scripting languages, first designed by Larry Wall
# in 1987. A lot of modern scripting langugas have its roots in perl and
# in some cases the syntax is quite identical. The camel logo made by O'Reilly
# has become the unofficial logo of the language. By the way, here's the
# reason why O'Reilly has animals all over their book covers:
# http://archive.oreilly.com/pub/a/oreilly//news/ediemals_0400.html

# At the time of this writing, perl is steadily on decline with criticisms
# such as 'write-only language'. I am going in pretty optimistic about it.
# As long as the code is written well and with good intent, the general
# syntax wouldn't bother me too much. It's not like developers are
# intentionally obfuscating code like in International Obfuscated C
# Code Contest. Here's an example: http://www.ioccc.org/2014/birken/prog.c

## Install perl at: https://www.perl.org/get.html
#! Comments are simular to py

use strict;             # looks like js got the statement from here...
use warnings;
# similar to js, perl is a language that is easy to shoot yourself
# in the foot and strict warnings are also helpful for big projects

print "'hello perl world'\n\n";    # the CS tradition

## Data Types
#! Scalars -> undef, number, string, reference
# are we also going to have vector types?
# I do see quite a bit of resemblance with js (undef-undefined)
# but references, we might be here for some pointer roller coaster ride

# Scalars are declared with $, arrays - @, hash - %

print "Variables: \n";
my $def = undef;    # variables are declared with my, like js var
#print $def;         # raises a warning only if use warnings; is declared
my $num = 40.5;
print "int: " . $num . "\n";  # . string concat php style
my $num1 = $num;    # probably a copy by value for atomic data types
print "num1: " . $num1 . "\n";   # no need for explicit type-casting like in py (str)

## Booleans - no boolean data type
##    false -> undef, number 0, string "", string "0"

# Numerical operators:  <,  >, <=, >=, ==, !=, <=>, +, *
# String operators:    lt, gt, le, ge, eq, ne, cmp, ., x
#     python does a much better job of string comparison
print "Strings " x 4 . "\n";     # interesting syntax
print 7 <=> 5;            # returns -1, 0, 1

## Arrays
my @firstArray = (
  "arrays",
  "are",
  "everywhere"
);
print "\n";
print $firstArray[0]. "\n";     # both @ and $ work here\
print $firstArray[-1]. "\n";    # negative indexes are possible, no surprise here

## Getting array length
print "firstArray has " . (scalar @firstArray) . " elements\n";
# seems like we are casting the array to a scalar type, weird

print "last populated index is " . $#firstArray . "\n";
@firstArray[3] = "last index";
print "last populated index is " . $#firstArray . "\n";
# returns 3 -> works as expected, not sure when it will be useful,
# not to mention the weird syntax

print "@firstArray" . "\n";  # joins elements with a space
# this could also be dangerous like in the case of an email
# bob@gmail.com -> the perl would look for an array @gmail => needs to be escaped

my $string = "array magic";
print "printing var string: $string \n";
print "printing a string: \$string \n";

print @firstArray ;    # prints out elements without any space
print "\n";
print @firstArray . "\n";    # concatinating a newline char results in 4?
# why would it do that? I'll have to look under the hood later cause this could
# result in some nasty bugs
