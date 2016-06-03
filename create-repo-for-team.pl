#!/usr/bin/perl
#
# Create team repo for each team.
# This requires a csv file that contains team names and team IDs.

use strict;
use warnings;
use JSON::Parse 'parse_json';

my $token = $ARGV[0];
my $orgName = $ARGV[1];
my $githubUrl = "https://api.github.com";

my $file = $ARGV[2] or die "Need to get CSV file on the command line\n";

open(my $data, '<', $file) or die "Could not open '$file' $!\n";

my $header_line = <$data>;
my @headers = split "," , $header_line;

while (my $line = <$data>) {
  chomp $line;
  my @fields = split "," , $line;
  my $teamName = $fields[0];
  my $teamId = $fields[1];

  print "create repo for $teamName : $teamId\n";
  my $response = `curl -s -H "Authorization: token $token" -H "Content-type: application/json" -X POST -d '{"name": "$teamName Project", "description": "$teamName Project", "private": true, "team_id": $teamId, "auto_init": true}' "$githubUrl/orgs/$orgName/repos"`;

  $response = parse_json $response;
  my $repo_name = $response->{"name"};

  print "change $repo_name permission\n";
  `curl -s -H "Authorization: token $token" -H "Content-type: application/json" -X PUT -d '{"permission": "push"}' "$githubUrl/teams/$teamId/repos/$orgName/$repo_name"`;
}

