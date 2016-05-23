#Confirm redis is running
redis-cli PING
if [ "$ERROR_MSG" != "PONG" ]; then
	echo "Redis is running"
else
	echo "Please start redis-server"
    exit 1
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
https://github.com/amida-tech/dre-services.git ..
# NPM install and run
npm install
npm start

# Clone frontend repo in sibling directory
https://github.com/amida-tech/dre-frontend.git ..
# NPM install and run
npm install
bower install
grunt serve