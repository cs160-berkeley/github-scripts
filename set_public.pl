#!/usr/bin/perl -w
#
# Change repo visibility: set target private repos to public.

use JSON::Parse 'parse_json';

$token = $ARGV[0];
$orgName = $ARGV[1];
$githubUrl = "https://api.github.com";

# TODO: Read page number.
for $page (1..15) {
  $jsonResponse = `curl -s -H "Authorization: token $token" -H "Content-type: application/json" -X GET -d '{"type": "private"}' "$githubUrl/orgs/$orgName/repos?page=$page"`;
  $perlResponse = parse_json $jsonResponse;
  for $repo (@{$perlResponse}) {
    $repoName = $repo->{'name'};
    $repoIsPrivate = $repo->{'private'};

    next if !$repoIsPrivate;
    # next if $repoName eq 'repoName_that_remains_private';

    print "set $repoName public\n";
    `curl -H "Authorization: token $token" -H "Content-type: application/json" -X PATCH -d '{"private": false}' "$githubUrl/repos/$orgName/$repoName"`
  }
}
