use strict;
use warnings;

package Animal;

sub eat {
  my $self = shift @_;
  foreach my $food (@_) {
    if (self->can_eat($food)) {
      print "Eating ", $food;
    } else {
      print "Can't eat ", $food;
    }
  }
}

sub can_eat {
  return 1;
}

return 1;
