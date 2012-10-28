package Dancer::Template::Mustache;
BEGIN {
  $Dancer::Template::Mustache::AUTHORITY = 'cpan:YANICK';
}
{
  $Dancer::Template::Mustache::VERSION = '0.1.0';
}
# ABSTRACT: Wrapper for the Mustache template system

use strict;
use warnings;

use Template::Mustache;
use Dancer::Config 'setting';

use base 'Dancer::Template::Abstract';

sub default_tmpl_ext { "mustache" };

my $_mustache;
my $_template_path;

sub init { 
    my $self = shift;
    my %config = %{$self->config || {}};

    $_mustache = Template::Mustache->new( %config );

    $_template_path = setting( 'views' ) || $FindBin::Bin . '/views';
}

sub render {
    my ($self, $template, $tokens) = @_;

    local $Template::Mustache::template_path = $_template_path;

    # remove the views part
    $template =~ s#^\Q$_template_path\E/?##;

    local $Template::Mustache::template_file = $template;
    
    return $_mustache->render($tokens);
}

1;

__END__

=pod

=head1 NAME

Dancer::Template::Mustache - Wrapper for the Mustache template system

=head1 VERSION

version 0.1.0

=head1 SYNOPSIS

    # in config.yml
   template: mustache

   # in the app
   get '/style/:style' => sub {
       template 'style' => {
           style => param('style')
       };
   };

   # in views/style.mustache
   That's a nice, manly {{style}} mustache you have there!

=head1 DESCRIPTION

This module is a L<Dancer> wrapper for L<Template::Mustache>. 

For now, the extension of the mustache templates must be C<.mustache>.

Partials are supported, as are layouts. For layouts, the content of the inner
template is sent via the usual I<content> template variable. So a typical 
mustached layout would look like:

    <body>
    {{ content }}
    </body>

=head1 AUTHOR

Yanick Champoux <yanick@babyl.dyndns.org>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2012 by Yanick Champoux.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut
