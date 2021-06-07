package api.pl;
use strict;
use warnings FATAL => 'all';
use REST::Client;
use JSON;
# Data::Dumper makes it easy to see what the JSON returned actually looks like
# when converted into Perl data structures.
use Data::Dumper;
use MIME::Base64;


if ($#ARGV ne 0) {
    print "usage: $0 <username>\n";
    exit 1;
}
my $reviewerToRemove = $ARGV[0];
my $username = 'admin';
my $password = 'admin';
my $headers = {};
my $client = REST::Client->new();
$client->setHost('http://api.openweathermap.org');
$client->GET(
    '/data/2.5/weather?q=London&appid=5ab37bfe20f2f2df03f9fe16af8d6e55',
    $headers
);
my $response = from_json($client->responseContent());
print($response);

1;