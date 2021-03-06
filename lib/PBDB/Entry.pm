package PBDB::Entry;

use strict;
use warnings;
use Data::Dumper;

sub new
{
    my $class = shift;
    my $this  = {@_};
    bless $this, $class;
}

sub to_string {
	return Dumper($_[0])
}

sub to_query_string
{
    my $self = shift;
    return
	join "&", map {
	    sprintf("%s=%s", $_, $self->{$_})
	}
	keys %{$self};
    #return sprintf( 'name=%s&email=%s&phone=%s',
    #    $_[0]->{Name}, $_[0]->{Email}, $_[0]->{Phone} );
}

sub to_array_ref {
    my $self = shift;
    return [ map { $_ => $self->{$_} } keys %{$self} ];
    #[ 'name', $_[0]->{Name}, 'email', $_[0]->{Email}, 'phone', $_[0]->{Phone} ]
}

sub find {
    my $self = shift;
    return PBDB::Entry->new( Id => shift );
}

1;

