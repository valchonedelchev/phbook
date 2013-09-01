package Command::Delete;

use Carp;
use strict;
use warnings;
use base 'Command';

our $VERSION = '1.0';

sub execute
{
    my $self = shift;
    die { error => "Todo at " . __PACKAGE__ . " Line:" . __LINE__ };
}

1;

