package PBDB::File;

use strict;
use warnings;

use base 'PBDB::Abstract';

sub new {
	my $class = shift;
	bless {@_}, $class;
}

sub add {
	die { error => 'Not implemented in ' . __PACKAGE__ . ' ' . __LINE__ };
	return 1;
}

1;
