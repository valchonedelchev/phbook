package Command::Exit;

use strict;
use warnings;
use base 'Command';

our $VERSION = '1.0';

sub execute {
    my $self = shift;
    print("Thank you for using this PhoneBook!\n");
    exit;
}

1;
