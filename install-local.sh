#Confirm redis is running
ERROR_MSG=`redis-cli PING`
if [ "$ERROR_MSG" != "PONG" ]; then
	echo "Please start redis-server"
    exit 1
else
	echo "Redis is running"
fi

# Confirm mongodb is running
mongo --eval "db.stats()"
RESULT=$?   # returns 0 if mongo eval succeeds
if [ $RESULT -ne 0 ]; then
    echo "Please start mongod"
    exit 1
else
    echo "MongoDB is running"
fi

# Run FHIR server
./hapi/hapi.sh start

# Clone services repo in sibling directory
cd ..
git clone https://github.com/amida-tech/dre-services.git
# set correct FHIR path
cd ./dre-services
find . -type f -name "*.js" -exec sed -i '' 's#/fhir/baseDstu2#/fhir-test/baseDstu2#g' {} \;
# NPM install and run
npm install
npm start &

# Clone frontend repo in sibling directory
cd ..
git clone https://github.com/amida-tech/dre-frontend.git
# NPM install and run
cd ./dre-frontend
npm install
bower install
grunt ngconstant:local
grunt serve &
