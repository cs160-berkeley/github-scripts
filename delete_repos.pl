#!/usr/bin/perl
#
# Deletes all organization repos that are listed in a csv.
# This requires a csv file that contains the names of all the repos to delete.
#
# Example csv format (showing the header and a sample row):
# Repo Name,
# Group-0-Project

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
  my $repoName = $fields[0];

  print "deleting repo: $repoName\n";

  my $response = `curl -s -H "Authorization: token $token" -H "Content-type: application/json" -X DELETE "$githubUrl/repos/$orgName/$repoName"`;

  print "response: $response";

}
