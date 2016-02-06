# Scripts for GitHub Management

This repository contains the shell and pearl scripts for managing an organization on GitHub.

## Prerequisite

* Visit [GitHub Education](https://education.github.com/) to request of an advanced organization plan. We received a diamond plan with 300 private repos.
* Add GSIs as owners.
* See [GitHub Help](https://help.github.com/articles/creating-an-access-token-for-command-line-use/) on _Creating an access token for command-line use_

## Adding Members to a GitHub Organization

Run `invite_user.sh` to automatically retrieve a list of GitHub usernames from a text file and add to an organization. Added members will received an email notification. They can also visit the organization page (e.g., [https://github.com/cs160-sp16](https://github.com/cs160-sp16)) to accept the invitation.

```
./invite_user.sh your_github_token your_org_id filename
```

Example:

```
./invite_user.sh your_github_token cs160-sp16 students0128
```

Be sure to change the script access permission via `chmod a+x`

## Tagging Repos

Run `get_repos.pl` to automatically tag all the private repos to lock the submitted version.

```
./get_repos.pl your_github_token your_org_id
```

## Reference

[GitHub API](https://developer.github.com/v3/)

## Contact

Peggy Chi (peggychi@cs.berkeley.edu)

## Acknowledgments

Senpo Hu for building up the scripts
