# TerraSwarm

Creates a Docker Swarm cluster in CoreOS

## Running in Development

You can run a Docker Swarm cluster on Mac OS using corectl

1. Install corectl `brew install corectl`
1. Install xhyve `brew install xhyve`
1. `./dev-run`
1. `corectl ssh swarm00`
1. `docker -H tcp://$COREOS_PRIVATE_IPV4:2375 info`

## Terraform

Coming soon