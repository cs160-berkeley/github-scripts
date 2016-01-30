# Adding Members to a GitHub Organization

This repo contains a shell script that automatically retrieves a list of GitHub usernames and sends invitations to be added to an organization.

## Usage

```
./invite_user.sh your_github_token your_org_id filename
```

Example:

```
./invite_user.sh your_github_token cs160-sp16 students0128
```

Be sure to change the script access permission by `chmod a+x`

See [GitHub Help](https://help.github.com/articles/creating-an-access-token-for-command-line-use/) on _Creating an access token for command-line use_

## Reference

[GitHub API](https://developer.github.com/v3/)

## Contact

Peggy Chi (peggychi@cs.berkeley.edu)

## Acknowledgments

Senpo Hu for building up the script
