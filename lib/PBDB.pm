package PBDB;

use strict;
use warnings;
use PBDB::File;
use PBDB::Cloud;

our $VERSION = '1.0';

sub DRIVER_FILE    { 'file' }
sub DRIVER_CLOUD   { 'cloud' }
sub DRIVER_DEFAULT { DRIVER_CLOUD }

sub new
{
    my $class = shift;
    my $this  = {@_};
    $this->{driver} = PBDB->DRIVER_DEFAULT unless $this->{driver};
    bless $this, $class;
    return $this->_get_driver();
}

sub _get_driver
{
    my $self = shift;
    return PBDB::File->new  if $self->{driver} eq PBDB->DRIVER_FILE;
    return PBDB::Cloud->new if $self->{driver} eq PBDB->DRIVER_CLOUD;
    die { error => "Failed to load database driver!" };
}

# array = find( *string )
sub find { die { error => 'abstract' } }

# bool = add( PBDB::Entry )
sub add { die { error => 'abstract' } }

# bool = del( PBDB::Entry )
sub del { die { error => 'abstract' } }

1;

