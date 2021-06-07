package api;
use strict;
use warnings FATAL => 'all';
use REST::Client;
use JSON;
# Data::Dumper makes it easy to see what the JSON returned actually looks like
# when converted into Perl data structures.
use Data::Dumper;
use MIME::Base64;

print("ingrese una ciudad para averiguar su clima");
my$ciudad = <STDIN>;#The basic use case
print($ciudad);
my $client = REST::Client->new();
$client->GET("http://api.openweathermap.org/data/2.5/weather?q=$ciudad&appid=5ab37bfe20f2f2df03f9fe16af8d6e55");
print $client->responseContent();
%respuesta=$client->responseContent();
print(%respuesta{$weather})


