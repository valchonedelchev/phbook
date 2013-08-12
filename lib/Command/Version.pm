package Command::Version;
use base 'Command';

our $VERSION = '1.0';

sub execute {
    my $self = shift;
    $self->print("This awesome application is for testing purposes.");
    $self->print( "This program version is " . $self->VERSION );
}

1;
