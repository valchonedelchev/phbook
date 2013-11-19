package Command::Delete;

use Carp;
use strict;
use warnings;

use PBDB;
use base 'Command';

our $VERSION = '1.0';

sub execute
{
    my $self = shift;
    my $id = $self->prompt('Record to delete? ');
    PBDB->new()->del(PBDB->new->find(PBDB::Entry->new(Id => $id)));
    die { error => "Todo at " . __PACKAGE__ . " Line:" . __LINE__ };
}

1;

