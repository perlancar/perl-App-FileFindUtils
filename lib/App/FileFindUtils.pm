package App::FileFindUtils;

use strict;
use warnings;

# AUTHORITY
# DATE
# DIST
# VERSION

our %SPEC;

$SPEC{find_wanted} = {
    v => 1.1,
    summary => 'Find files based on some criteria (CLI front-end for File::Find::Wanted)',
    args => {
        wanted => {
            schema => 'code_from_str*',
            req => 1,
            pos => 0,
        },
        dirs => {
            schema => ['array*', of=>'dirname*'],
            default => ['.'],
        },
    },
    result_naked => 1,
};
sub find_wanted {
    my %args = @_;

    require File::Find::Wanted;
    File::Find::Wanted::find_wanted($args{wanted}, @{ $args{dirs} });
}

1;
#ABSTRACT: Utilities related to finding files

=head1 DESCRIPTION

This distribution provides the following command-line utilities:

# INSERT_EXECS_LIST


=head1 SEE ALSO

=cut
