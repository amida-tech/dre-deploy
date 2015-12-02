# Docker deployment script
This script will get a DRE up and running by starting and linking Docker containers for the following components:

- Mongo
- Redis
- HAPI-FHIR
- DRE-services
- DRE-frontend

## Installing Docker
To install Docker in Windows or OSX, you should use [Docker Toolbox](https://www.docker.com/docker-toolbox). Once Toolbox is installed, open a Docker quickstart terminal.

For installation instructions on additional operating systems, refer to the Docker [supported installation](https://docs.docker.com/v1.8/installation/) page.

## Running the script
In your Docker terminal, simply run:

```bash
$ sh docker.sh
```

This will download all containers and run them according to the instructions in the script. To make sure all of the containers are running:

```bash
$ docker ps
```

You should see all five containers listed as running.