package Command::Option;

use strict;
use warnings;
use PBDB;
use base 'Command';

our $VERSION = '1.0';

sub execute
{
    my $self = shift;
    
    $self->print("Options available:\n storage-file, storage-cloud, which-storage");
    my $option = $self->prompt("Option? ");
    
    if ($option) {
        PBDB->set_driver(PBDB->DRIVER_CLOUD) if $option eq 'storage-cloud';
        $ENV{PBDB_DRIVER} = PBDB->DRIVER_FILE  if $option eq 'storage-file';
        $self->print("Storage is " . PBDB->get_storage) if $option eq 'which-storage';
    }
    return 1;
}

1;

