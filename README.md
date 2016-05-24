# Data Reconciliation Engine (DRE) deployment scripts
Amida DRE Deployment scripts

The primary target is vagrant - automatically create VM with frontend/services/mongo/redis/fhir server started.

Vagrant VM (VirtualBox) configured to use host-only network with IP 192.168.33.10
DRE frontend accessible on http://192.168.33.10:3000, FHIR server is on http://192.168.33.10:8080/fhir

Change ansible variable `service_host` to a correct value before running script (host where dre-services and FHIR server will run)

## Docker
Alternatively, you can use the `docker-compose` configuration found in the `docker` directory.

## Local setup
For a deployment using exclusively local deployments, run the `install-local.sh` script. You will need mongo and redis running locally, and you may encounter errors if certain npm dependencies are not installed globally.

For testing purposes, it is strongly recommended to use Vagrant/Ansible or Docker.

## Release Notes

See release notes [here] (./RELEASENOTES.md)

## License

Licensed under [Apache 2.0](./LICENSE)
