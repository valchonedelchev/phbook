package Command;

use strict;
use warnings;

our $VERSION = '1.0';

my $prefix = 'pbk> ';

my $aliases = {
    'add'   => 'create',
    ''      => 'help',
    'usage' => 'help',
    'h'     => 'help',
    '?'     => 'help',
    'q'     => 'exit',
    'quit'  => 'exit',
    's'     => 'search',
    'l'     => 'list',
    'v'     => 'version',
};

sub prompt {
    my $self = shift;
    my $message = shift || $prefix;
    print $message;
    chomp( my $command = <STDIN> );
    return $command;
}

sub dispatch {
    my $self = shift;
    my $command = shift || Command->prompt();
    $self->resolve($command);
}

sub resolve {
    my $self    = shift;
    my $command = shift;

    $command = $aliases->{$command} if exists $aliases->{$command};

    my $module  = sprintf "Command/%s.pm", ucfirst( lc($command) );
    my $package = sprintf "Command::%s",   ucfirst( lc($command) );
    eval {
        require "$module";
        $package->import;
        $package->execute;
    } or do {
        if ( ref $@ and exists $@->{error} ) {
            $self->print( "Command [$command] failed - " . $@->{error} );
        }
        else {
            $self->print("Command [$command] failed!");
        }
        return 0;
    };

    return 1;
}

sub print {
    my $self = shift;
    my $text = shift;
    print $prefix . $text . "\n";
}

sub execute {
    die "abstract";
}

1;

