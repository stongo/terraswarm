# TerraSwarm

Creates a Docker Swarm cluster in CoreOS

## Running in Development

You can run a Docker Swarm cluster on Mac OS using corectl

1. Install corectl `brew install corectl`
1. Install xhyve `brew install xhyve`
1. `./dev-run`
1. `corectl ssh swarm00`
1. `docker -H tcp://$COREOS_PRIVATE_IPV4:2375 info`
1. If you have [Docker For Mac](https://docs.docker.com/docker-for-mac/) installed or Docker CLI, you can access it directly at any of the swarm members IP address. `corectl ps` will list the ip under `Network.eth0` and then `docker -H tcp://192.168.64.62:2375 info` for example
1. Create an overlay network `docker -H tcp://192.168.64.62:2375 network create --driver overlay picard`

## Terraform

Coming soon