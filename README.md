# SETUP

* Duplicate .env.example and rename the file to .env

* Fill .env in with your Twitter API credentials

* Install Docker
 
* Run `docker-compose build`

* Run `docker-compose run --rm web rake db:create`

* Run `docker-compose run --rm web rake db:migrate`

* Run `docker-compose up` to start the server

* Application should be available at `localhost:3000`