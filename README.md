# Docker Me Crazy

![alt
text](https://github.com/dmitrinesterenko/docker_me_crazy/blob/master/documentation/images/docker-me-crazy-home-screen.png "It's just that simple to launch a docker container")


Deploy your docker application by providing a dockerfile url.

Paste in the URL into the text box and hit launch.

## Development
Run tests with `rails tests`

The model for launch and it's helpers implement most of the functionality.
The controllers do controlly things and views handle the presentation. Well it's
that simple.

## Infrastructure
`scripts/deployment/create.sh` currently creates the hosts with docker-machine.
A few secrets that are specific to you are necessary: AWS_ACCESS_ID and
AWS_SECRET_ACCESS_KEY, VPC_ID and SUBNET_ID. All of this the end user should
not care about at all.

## Contributing
[ ] Is it tested?
[ ] Is it an improvement?
[ ] Is it polite?
[ ] Is it thoughtful?
