use strict;
use warnings;

use Test::More tests => 4;

{
    package MyApp;

    use Dancer ':syntax';

    set views => 't/app_views';

    set engines => {
        mustache => { 
        },
    };

    set template => 'mustache';

    get '/' => sub {
        template 'index';
    };

    get '/style/:style' => sub {
        template 'index' => {
            style => param('style')
        };
    };

    get '/partial' => sub {
        template 'partial';
    };
}

use Dancer::Test;

response_content_like [ GET => '/' ], qr/Welcome manly mustached man/, 
    "template file found";

response_content_unlike [ GET => '/' ], qr/Nice/, 
    "section with undef => not shown";

response_content_like [ GET => '/style/pencil' ], qr/Nice pencil mustache/, 
    "interpolation and section";

response_content_like [ GET => '/partial' ], qr/:\}\)=/, 
    "partials work";



