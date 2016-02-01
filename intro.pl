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

print "hello world";    # the CS tradition

## Data Types
#! Scalars -> undef, number, string, reference
# are we also going to have vector types?
# I do see quite a bit of resemblance with js (undef-undefined)
# but references, we might be here for some pointer roller coaster ride

my $def = undef;  # variables are declared with my, like js var
print $def;       # raises a warning only if use warnings is on
my $num = 40.5;
print $num;
my $num1 = $num;  # probably a copy by value for atomic data types
print $num1;

print "Hello " . $num1;   # . string concat is quite nostalgic from php
