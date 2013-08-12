package PBDB::Entry;

use strict;
use warnings;

sub new {
    my $class = shift;
    my $this  = {@_};
    bless $this, shift;
}

1;

