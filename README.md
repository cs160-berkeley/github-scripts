# Scripts for GitHub Management

This repository contains the shell and pearl scripts for managing an organization and repositories on GitHub used for CS160 Spring 2016.

## Prerequisite

* Visit [GitHub Education](https://education.github.com/) to request of an advanced organization plan. For the Spring 2016 class, we received a diamond plan that allows up to 300 private repos.
* Add GSIs as owners.
* Follow [GitHub Help](https://help.github.com/articles/creating-an-access-token-for-command-line-use/) for _Creating an access token for command-line use_
# Set up your shell or perl environment. [Perlbrew](http://perlbrew.pl/) is a useful management tool.

## Adding Members to a GitHub Organization

`invite_user.sh` automatically retrieves a list of GitHub usernames from a text file and adds user one by one to an organization. Added members will need to accept the invitation via email notification sent by GitHub or visit the organization page (e.g., [https://github.com/cs160-sp16](https://github.com/cs160-sp16)).

```
./invite_user.sh your_github_token your_org_id filename_of_student_list
```

Be sure to change the script access permission via `chmod a+x`

## Managing Repos

Note: This requires having a perl module that reads json content.

* `tag_repos.pl` tags target private repos to label the submitted version.
* `set_public.pl` changes the visibility of target private repos to public.

```
./tag_repos.pl your_github_token your_org_id
```

## Reference

[GitHub API](https://developer.github.com/v3/)

## Contact

Peggy Chi (peggychi@cs.berkeley.edu)

## Acknowledgments

Senpo Hu for helping build up the scripts
