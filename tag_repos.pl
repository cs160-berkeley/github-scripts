#!/usr/bin/perl -w

use JSON::Parse 'parse_json';

$tagName = "v1.0";
$releaseDescription = "prog2b submission";

$token = $ARGV[0];
$orgName = $ARGV[1];
$githubUrl = "https://api.github.com";

# TODO: Read page number. See response.headers:
# $ curl -H "Authorization: token _YOUR_TOKEN" -H "Content-type: application/json" -X GET -d '{"type": "private"}' -D - "https://api.github.com/orgs/cs160-sp16/repos" | more
for $page (1..12) {
  $jsonResponse = `curl -s -H "Authorization: token $token" -H "Content-type: application/json" -X GET -d '{"type": "private"}' "$githubUrl/orgs/$orgName/repos?page=$page"`;
  $perlResponse = parse_json $jsonResponse;
  for $repo (@{$perlResponse}) {
    $repoName = $repo->{'name'};
    $repoIsPrivate = $repo->{'private'};

    next unless $repoIsPrivate;
    next if $repoName eq 'assignment-template';
    next if $repoName eq 'github-scripts';
    next if $repoName eq 'prog-01-crunch-time-peggychi';

    print "Create tag $tagName for $repoName\n";
    `curl -H "Authorization: token $token" -H "Content-type: application/json" -X POST -d '{"tag_name": "$tagName", "target_commitish": "master", "name": "$tagName", "body": "$releaseDescription"}' "$githubUrl/repos/$orgName/$repoName/releases"`
  }
}
