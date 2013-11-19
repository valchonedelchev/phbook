package Command::Create;

use strict;
use warnings;
use PBDB;

use base 'Command';

our $VERSION = '1.0';

sub execute {
    my $self = shift;

    my $name  = $self->prompt('(1/3) Full Name: ');
    my $email = $self->prompt('(2/3) Email Address: ');
    my $phone = $self->prompt('(3/3) Phone Number: ');

    my $r = PBDB->new->add(
        PBDB::Entry->new(
            Name  => $name,
            Email => $email,
            Phone => $phone
        )
    );
    
    $self->print($r);
}

1;

