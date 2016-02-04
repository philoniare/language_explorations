# Notes on perl
# Author: philoniare
# Last Updated: 1/31/2016

## Motivation: I needed to learn some perl to make an IA for DuckDuckGo

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
## Official documentation: http://perldoc.perl.org/
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
# with either \ or ''

my $string = "array magic";
print "printing var string: $string \n";
print "printing a string: \$string \n";     # alternative syntax: '@array'

print @firstArray ;    # prints out elements without any space
print "\n";
print @firstArray . "\n";    # concatinating a newline char results in 4?
# why would it do that? I'll have to look under the hood later cause this could
# result in some nasty bugs


## Hash variables
my %fav_languages = (
  "python" => 1995,
  "swift"  => 2014,
  "haskell" => 1990
);
# accessing hash value
print $fav_languages{"python"};
print %fav_languages{"swift"};  # interesting, returns both key and value
print "\n";
# converting a hash into array:
my @fav_languages_arr = %fav_languages;
print "@fav_languages_arr \n";       # no specific order to it

## Recap: [] refers to arrays, {} refers to hash

my $data = "orange";
my @data = ("purple");
my %data = ( "0" => "blue");

print $data;      # "orange"
print $data[0];   # "purple"
print $data["0"]; # "purple"
print $data{0};   # "blue"
print $data{"0"}; # "blue
print "\n";

# Lists - are not variables, but a DS you use to create arrays and hash variables
# uses the () syntax as we have seen before, but important thing to remember is
# that they can't be nested
my @array = (
	"apples",
	"bananas",
	(
		"inner",
		"list",
		"several",
		"entries",
	),
	"cherries",
);
# an array like this would simply be flattened
print "@array";

print "\n";
# this could result in unexpected behavior in the case of hash:
my %hash = (
	"beer" => "good",
	"bananas" => (
		"green"  => "wait",
		"yellow" => "eat",
	),
);
print $hash{"wait"};
print "\n";

# the side benefit of this is the ease of concatenating arrays
my @prog_languages = ("python", "swift", "perl");
my @foreign_languages = ("russian", "japanese");
my @languages = (@prog_languages, @foreign_languages, "korean");
print "@languages";
print "\n";


## Context - either a scalar or list context
my @item = "keyboard";  # silently conversion to a array with single element
print "@item";
print "\n";

# The concept of the context explains the behavior we got at line 88, when a
# string in concatenated, the array is silently coverted into a scalar, or the
# length of the array. Here is another example:
my $scalar_languages = @prog_languages;
print $scalar_languages; # "3"
print "\n";

# the workaround for the scalar conversion is to use a ',' with print function
print $scalar_languages, "\n";

# forcing expession context to be scalar
print scalar reverse "hello perl";
print "\n";

## References
# scalar variable can contain reference to any variable
my $color = "Indigo";
my $scalarRef = \$color;
print $scalarRef;
print "\n";
print ${ $scalarRef } . "\n";    # kind of like dereferencing a pointer
# alternative syntax: $$scalarRef, for arrays: @$arrayRef

# if reference points to an array or hash, the data can be accessed by:
my @colors = ("red", "blue", "green", "orange");
my $arrayRef = \@colors;
print $arrayRef->[0];     # for hash: $hashRef->{"key"};
print "\n";

## More complex data structures:
# generally since complex types like arrays and hash can't be nested, we can
# use references whenever a scalar variable is needed
# Here's the example from the guide:
my %owner1 = (
	"name" => "Santa Claus",
	"DOB"  => "1882-12-25",      # Santa is turning 134 years old this year
);

my %owner2 = (
	"name" => "Mickey Mouse",
	"DOB"  => "1928-11-18",
);

my @owners = ( \%owner1, \%owner2 );

my %account = (
	"number" => "12345678",
	"opened" => "2000-01-01",
	"owners" => \@owners,
);

print $account{"owners"}->[0]{"name"}, "\n";    # getting the first owner's name

# Can simplify the flow with anynomous arrays('[]') and hashes ('{}')
%account = (
	"number" => "31415926",
	"opened" => "3000-01-01",
	"owners" => [
		{
			"name" => "Philip Fry",
			"DOB"  => "1974-08-06",
		},
		{
			"name" => "Hubert Farnsworth",
			"DOB"  => "2841-04-09",
		},
	],
);

# Accessing the elements
print "Account #", $account{"number"}, "\n";
print "Opened on ", $account{"opened"}, "\n";
print "Joint owners of the account:\n";
print "\t", $account{"owners"}->[0]->{"name"}, "\n";
print "\t", $account{"owners"}->[1]->{"name"}, "\n";


## Conditionals:
# basic syntax - if ... elsif ... else ...
# possible short syntax
my $word = "long string";
print "'", $word, "' is actually long.", "\n" if (length $word) >= 10;

# also has unless ... else ... similar to ruby syntax
my $dead = 0;
print "Time to code", "\n" unless $dead == 1;

# Ternary operator (can be nested):
my $speed = 70;
my $speed_limit = 50;
print "You are ", ($speed >= $speed_limit ? "over " : "under "),
  "the speed limit.\n";

## Loops
# The conventional while loop:
@array = ("sports", "entertainment");
my $i = 0;
while($i < scalar @array) {   # scalar returns the length
  print $i, ": ", $array[$i], "\n";
  $i++;
}

# until loop, looks like ruby was influenced quite a bit by perl
# until($i >= scalar @array), self-explanatory
# do {statement} while(cond);
# the do loop executes at least once, therefore displays warning if array is empty
# and the classic for loop:
# for (my $i = 0; $i < scalar @array; $i++)
# but for iterating over an array or hash, foreach loop is better
foreach my $string (@array) {
  print $string, "\n";
}
# specific range can also be indicated:
  # foreach my $i (0 .. $#array) {
  #  print $array[$i], "\n";
  # }
# note that .. is inclusive

# sort alphabetically sorts the keys
foreach my $key (sort keys %fav_languages) {
	print $key, ": ", $fav_languages{$key}, "\n";
}

# shorter syntax: print $_ foreach @array;
# in perl continue and break are next and last

## Array Functions
my @stack = ("Fred", "Eileen", "Denise", "Charlie");
print "@stack", "\n";
print "Last element: ", pop @stack, "\n";   # removes and returns final element
push @stack, "Bob", "Alice";  # same syntax as other scripting languages
print "@stack", "\n";
print shift @stack, "\n";   # removes and returns first element
unshift @stack, "Hank";   # removes and returns first element
print "@stack";
print "\n";
# print splice(@stack, 1, 3, "<<<", ">>>"), "\n";
# print "@stack";

# Other functions:
print join(", ", @stack), "\n";
print reverse("Hello", "World"), "\n";
print scalar reverse ("Hello", "World"), "\n";

# map also does what is expected:
print join ", ", map {uc $_ } @stack, "\n";
# applies function uc to all elements of @stack

# grep is the same as filter in py
print join ", ", grep { length $_ > 5 } @stack;
print "\n";

# the default sort seems to be sorting numbers in alphabetical order:
my @not_so_random_numbers = (10, 11, 7, 9, 1, 100);
print join ", ", sort @not_so_random_numbers;
print "\n";

# to really sort the numbers, we can chain methods:
print join ", ", sort { $a <=> $b } @not_so_random_numbers;
# a more complex comparator can also be supplied with sub {}
print "\n";

## Functions or subroutines - calls by reference
sub hyphenate {
  my $word = shift @_;  # get the first parameter
  $word = join "-", map {substr $word, $_, 1}(0..(length $word)-1);
  return $word;
}
print hyphenate("dusk");

sub new_line {
  print "\n";
}
new_line;   # needed it for a while

## Unpacking subroutine arguments
# Unpacking in one-go:
sub left_pad {
  my ($oldString, $width, $padChar) = @_;
  my $newString = ($padChar x ($width - length $oldString)) . $oldString;
  return $newString;
}
print left_pad("lefty", 10, ">");
new_line;

# Providing key value pairs in parameter
sub right_pad {
  my %args = @_;
  my $newString = $args{"oldString"}. ($args{"padChar"} x ($args{"width"} - length $args{"oldString"}));
}
print right_pad("oldString" => "righty", "padChar" => "<", "width" => 10);
new_line;

# exit <- like a return from the main function in C
# running a system command and capturing output
my $directory_listing = `ls`;
print $directory_listing;

# I'll skip file IO for now

## Regular expressions:
$string = "Hello world";
if (my @matches = $string =~ m/(\w+)\s+(\w+)/) {    # matches (word space word)
  print "matches the regex";
  new_line;
  print "submatch 1: ", $1;
  new_line;
  print "submatch 2: ", $2;
  new_line;
  print "matches: ", join ", ", map { $_ } @matches;
}
new_line;

# Regex substitution:
$string = "Good morning world";
$string =~ s/morning/evening/;
print $string;
new_line;

# m//g finds one match after another:
$string = "a tonne of feathers or a tonne of bricks";
while($string =~ m/(\w+)/g) {
  print "'".$1."'\n";
}

# s///g global match & replace, as well as returns the number of matches
# /i - case sensitive
# /x - allows for whitespace and comments

## Modules -.pm files that can be included in other script files
#   - needs to return 1;
#   - needs to in perl path
#   - use require to execute it
#       (e.g. require Demo::StringUtils) -> Demo/StringUtils.pm

## Packages
# The golden rule with working perl packages
#   1. Perl script (.pl) must always contain 0 package declarations.
#   2. Perl module (.pm) must always contain exactly one package declaration,
#       corresponding to its name and location


## Object-Oriented Perl
# to tell a variable what class it belongs to, use bless. What a keyword!
# to check variable class, use ref.
require Animal;       # don't forget to export the Animal.pm dir to your perl path
my $animal = {
  "legs"  => 4,
  "color" => "white"
};
print ref $animal;
bless $animal, "Animal";
$animal->eat("curry");

## Constructors:
sub new {
  my $class = shift @_;
  return bless { "legs" => 4, "color" => "white"}, $class;
}

my $animal1 = Animal->new();

## Inheritance
use parent ("Animal");

# can also override methods:
sub can_eat {
  return 1;
}

## Use of use:
use Animal();
# equivalent to:
# BEGIN { require Animal(); }
# should always be placed at the top and never inside conditionals
