# dre-deploy
DRE Deployment script

Primary target is vagrant - automatically create VM with frontend/services/mongo/redis/fhir server started.
Probably can be used for AWS deployment (not tested)

Vagrant VM (VirtualBox) configured to use host-only network with IP 192.168.33.10
DRE frontend accessible on http://192.168.33.10:3000, FHIR server is on http://192.168.33.10:8080/fhir

The "biggest" problem with dre-frontend is that it use configuration variables embedded into Gruntfile.js. Look at section 
```
      qa: {
        options: {
        },
        constants: {
          dreFrontendEnvironment: {
            name: 'qa',
            baseServerUrl:'http://dre.amida-demo.com:3000/api/v1',
            fhirServerUrl:'http://dev.ntrlab.ru:8080/fhir/baseDstu2',
            enableDebugLog:true
          }
        }
      },
```
it expect to have baseServerUrl and fhirServerUrl to be explicitly embedded into the code.
So, the one way to solve it is to create  similar section, say, 'remote' and replace
```
- name: build frontend (2)
  shell: grunt ngconstant:`qa` chdir=/home/dre/dre-frontend
  sudo: yes
  sudo_user: dre
```
to
```
- name: build frontend (2)
  shell: grunt ngconstant:`remote` chdir=/home/dre/dre-frontend
  sudo: yes
  sudo_user: dre
```
before running ansible script.
