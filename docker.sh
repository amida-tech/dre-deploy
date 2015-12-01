docker run --name dre-mongo -d mongo

docker run --name dre-redis -d redis

docker run -p 8080:8080 --name hapi-fhir -d amidatech/hapi-fhir

docker run -p 3000:3000 --name dre-services --link dre-mongo:mongo --link dre-redis:redis --link hapi-fhir:hapi  -d amidatech/dre-services

docker run -p 9000:9000 --name dre-frontend -d amidatech/dre-frontend