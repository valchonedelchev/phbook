package Command::Help;

use strict;
use warnings;
use base 'Command';

our $VERSION = '1.0';

sub execute {
    my $self = shift;
    $self->print(
        "Options available:\n create, delete, search, list, quit, help");
}

1;
