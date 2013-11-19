package PBDB::Cloud;

use strict;
use warnings;
use LWP::UserAgent;

use base 'PBDB::Abstract';

my $URL = 'http://afternoon-ocean-2850.herokuapp.com';
my $http  = LWP::UserAgent->new;

sub new
{
    my $class = shift;
    bless {@_}, $class;
}

sub find
{
    my ($self, $entry) = @_;
    print "Connecting to host: $URL/find?".$entry->to_query_string . $/;
    my $r = $http->post( "$URL/find", $entry->to_array_ref );
    die { error => $r->status_line } unless $r->is_success;
    return $r->decoded_content;
}

sub add
{
    my ( $self, $entry ) = @_;
    print "Connecting to host: $URL/create?".$entry->to_query_string . $/;
    my $r = $http->post( "$URL/create", $entry->to_array_ref );
    die { error => $r->status_line } unless $r->is_success;
    return $r->decoded_content;
}

sub del
{
    my ($self, $entry) = @_;
    print "Connecting to host: $URL/delete?" . $entry->to_query_string . $/;
    my $r = $http->post( "$URL/delete", $entry->to_array_ref );
    die { error => $r->status_line } unless $r->is_success;
    return $r->decoded_content;
    die { error => 'Not implemented in ' . __PACKAGE__ . ' ' . __LINE__ };
}

1;

