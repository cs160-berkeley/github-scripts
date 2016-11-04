#!/usr/bin/perl
#
# Create new teams under an organization and add team members.
# This requires a csv file that contains a list of student info
# that each includes a team number and github username.
#
# Example csv format (showing the header and a sample row):
# Team number,Student name,GitHub username
# 1,Studen Name A,username_a

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

my %membersOfGroup;

while (my $line = <$data>) {
  chomp $line;
  my @fields = split "," , $line;

  my $groupNumber = $fields[0];
  my $memberUsername = $fields[2];
  print "group[$groupNumber]: $memberUsername\n";

  # Save the new team info
  if (exists $membersOfGroup{$groupNumber}) {
    push @{$membersOfGroup{$groupNumber}}, $memberUsername;
  } else {
    $membersOfGroup{$groupNumber} = [$memberUsername];
  }
}

print "Team Name,Team Id\n";
for my $group (sort {$a <=> $b} keys %membersOfGroup) {
  my @users = @{$membersOfGroup{$group}};
  my $teamName = "Group $group";

  print "Create a new team : $teamName\n";
  my $jsonResponse = `curl -s -H "Authorization: token $token" -H "Content-type: application/json" -X POST -d '{"name": "$teamName", "description": "CS160 SP16 $teamName", "privacy": "secret"}' "$githubUrl/orgs/$orgName/teams"`;
  my $perlResponse = parse_json $jsonResponse;
  my $teamId = $perlResponse->{'id'};
  print "$teamName,$teamId\n";

  for my $username (@users) {
    print "  Add user:$username\n";
    my $url = "$githubUrl/teams/$teamId/memberships/$username";

    my $curlCommand = "curl -H \"Authorization: token $token\" -H \"Content-type: application/json\" -X PUT -d '{\"role\": \"member\"}' \"$url\"";
    my $jsonResponse = `curl -H "Authorization: token $token" -H "Content-type: application/json" -X PUT -d '{"role": "member"}' "$url"`;
  }
}
