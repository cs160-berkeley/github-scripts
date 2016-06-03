# Scripts for GitHub Organization Management

This repository contains the shell and pearl scripts for managing an
organization and repositories on GitHub used for [CS160 Spring
2016](http://teaching.paulos.net/cs160_SP2016/), UC Berkeley.

## Prerequisite

* Visit [GitHub Education](https://education.github.com/) to request an
advanced organization plan.
  * For the Spring 2016 class, we received a diamond plan that allows up to 300
private repos.
  * Given a class of 200+ students, our strategy was to release assignments one
by one (i.e., once done grading, we make all graded private repos public. We
then release the next assignment with private repos.)
* Add GSIs as owners.
* Follow [GitHub
Help](https://help.github.com/articles/creating-an-access-token-for-command-
line-use/) for _Creating an access token for command-line use_ # Set up your
shell or perl environment. [Perlbrew](http://perlbrew.pl/) is a useful
management tool.
* For each assignment, consider using [GitHub Classroom]
(https://classroom.github.com/) to set up a link that students can create
individual repos based on an assigned template.

## Adding members to a GitHub organization

`invite_user.sh` automatically retrieves a list of GitHub usernames from a text
file and adds user one by one to an organization. Added members will need to
accept the invitation via email notification sent by GitHub or visit the
organization page (e.g.,
[https://github.com/cs160-sp16](https://github.com/cs160-sp16)).

```
./invite_user.sh your_github_token your_org_id filename_of_student_list
```

Be sure to change the script access permission via `chmod a+x`

## Managing repos

Note: This requires having a perl module that reads json content.

* `tag_repos.pl` tags target private repos to label the submitted version.
* `set_public.pl` changes the visibility of target private repos to public.

```
./tag_repos.pl your_github_token your_org_id
```

## Creating new teams, adding team members, and creating team repos

This requires csv files that include team info. See the file headers for more
info.

* `create-team-and-add-members.pl` creates new teams and adds team members.
* `create-repo-for-team.pl` creates a team repo for each team.

## Reference

[GitHub API](https://developer.github.com/v3/)

## Contact

[Peggy Chi](https://github.com/peggychi/) (peggychi@cs.berkeley.edu)

## Acknowledgments

[Senpo Hu](https://github.com/senpo) for helping build up the scripts
