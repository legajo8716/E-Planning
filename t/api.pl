package api;
use strict;
use warnings FATAL => 'all';
use REST::Client;
use JSON;
# Data::Dumper makes it easy to see what the JSON returned actually looks like
# when converted into Perl data structures.
use Data::Dumper;
use MIME::Base64;

print("ingrese una ciudad para averiguar su clima\n\n");
my $json = JSON->new->allow_nonref;
my$ciudad = <STDIN>;#The basic use case

my $client = REST::Client->new();
$client->GET("http://api.openweathermap.org/data/2.5/weather?q=$ciudad&units=metric&appid=5ab37bfe20f2f2df03f9fe16af8d6e55");
my $response = from_json($client->responseContent());

print("Clima\n");
print ($response->{"weather"}[0]->{"main"});
print("\n");
print("Temperatura Actual\n");
print ($response->{"main"}->{"temp"});




