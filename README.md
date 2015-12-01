# Data Reconciliation Engine (DRE) deployment scripts
Amida DRE Deployment script

Primary target is vagrant - automatically create VM with frontend/services/mongo/redis/fhir server started.
Probably can be used for AWS deployment

Vagrant VM (VirtualBox) configured to use host-only network with IP 192.168.33.10
DRE frontend accessible on http://192.168.33.10:3000, FHIR server is on http://192.168.33.10:8080/fhir

Change ansible variable `service_host` to a correct value before running script (host where dre-services and FHIR server will run)

## Release Notes

See release notes [here] (./RELEASENOTES.md)

## License

Licensed under [Apache 2.0](./LICENSE)
