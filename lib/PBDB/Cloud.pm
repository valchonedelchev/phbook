package PBDB::Cloud;

use strict;
use warnings;
use LWP::UserAgent;

use base 'PBDB';

#my $URL = 'http://localhost:3000';
my $URL = 'http://afternoon-ocean-2850.herokuapp.com';
my $http  = LWP::UserAgent->new;

sub new
{
    my $class = shift;
    bless {@_}, $class;
}

sub find
{
    warn "GET url/find?q=...";
    die { error => 'Not implemented in ' . __PACKAGE__ . ' ' . __LINE__ };
}

sub add
{
    my ( $self, $entry ) = @_;
    print "Connecting to host: $URL...$/";
    my $r = $http->post( "$URL/create", $entry->to_array_ref );
    die { error => $r->status_line } unless $r->is_success;
    return $r->decoded_content;
}

sub del
{
    my $self = shift;
    
    die { error => 'Not implemented in ' . __PACKAGE__ . ' ' . __LINE__ };
}

1;

