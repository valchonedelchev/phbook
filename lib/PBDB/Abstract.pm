package PBDB::Abstract;

use strict;
use warnings;

sub DRIVER_FILE    { 'file' }
sub DRIVER_CLOUD   { 'cloud' }
sub DRIVER_DEFAULT { DRIVER_CLOUD }

sub new
{
    my $class = shift;
    my $this  = {@_};

    bless $this, $class;
    return $this->get_instance;
}

sub get_instance
{
    my $self = shift;

    $ENV{PBDB_DRIVER} = DRIVER_DEFAULT unless $ENV{PBDB_DRIVER};

    return PBDB::File->new  if $ENV{PBDB_DRIVER} eq DRIVER_FILE;
    return PBDB::Cloud->new if $ENV{PBDB_DRIVER} eq DRIVER_CLOUD;

    die { error => "Failed to load database driver!" };
}

# array = find( *string )
sub find { die { error => 'abstract' } }

# bool = add( PBDB::Entry )
sub add { die { error => 'abstract' } }

# bool = del( PBDB::Entry )
sub del { die { error => 'abstract' } }

sub get_storage
{
    defined $ENV{PBDB_DRIVER} ? $ENV{PBDB_DRIVER} : DRIVER_DEFAULT;
}

1;