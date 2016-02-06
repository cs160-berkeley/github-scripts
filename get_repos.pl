#!/usr/bin/perl -w

use JSON::Parse 'parse_json';

$tagName = "v1.0";
$releaseDescription = "prog1 submission";

$token = $ARGV[0];
$orgName = $ARGV[1];
$githubUrl = "https://api.github.com";

# TODO: Read page number.
for $page (1..7) {
  $jsonResponse = `curl -s -H "Authorization: token $token" -H "Content-type: application/json" -X GET -d '{"type": "private"}' "$githubUrl/orgs/$orgName/repos?page=$page"`;
  $perlResponse = parse_json $jsonResponse;
  for $repo (@{$perlResponse}) {
    $repoName = $repo->{'name'};

    next if $repoName eq 'assignment-template';
    next if $repoName eq 'github-scripts';

    print "Create tag $tagName for $repoName\n";
    `curl -H "Authorization: token $token" -H "Content-type: application/json" -X POST -d '{"tag_name": "$tagName", "target_commitish": "master", "name": "$tagName", "body": "$releaseDescription"}' "$githubUrl/repos/$orgName/$repoName/releases"`
  }
}
