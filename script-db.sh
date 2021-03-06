
# 
if [ -z "which psql" ]; then
	
	# Installing postgreSQL
	echo "Installing Postgresql 9.3"
	sudo sh -c "echo 'deb http://apt.postgresql.org/pub/repos/apt/ precise-pgdg main' > /etc/apt/sources.list.d/pgdg.list"
	wget --quiet -O - http://apt.postgresql.org/pub/repos/apt/ACCC4CF8.asc | sudo apt-key add -
	sudo apt-get update
	sudo apt-get install postgresql-common
	sudo apt-get install postgresql-9.3 libpq-dev
fi

sudo apt-get install postgresql-contrib-9.3

# Creating User on PostgreSQL
sudo -u postgres psql -c "CREATE USER $USER;"	

# Granting privileges to $USER on CREATEDB
sudo -u postgres psql -c "ALTER ROLE $USER SUPERUSER;"

bundle exec rake db:create

# Installing unaccent
#create extension unaccent schema pg_catalog;
sudo -u postgres psql -d ongarium-rails_development -c "CREATE EXTENSION IF NOT EXISTS UNACCENT"
sudo -u postgres psql -d ongarium-rails_test -c "CREATE EXTENSION IF NOT EXISTS UNACCENT"

bundle exec rake db:migrate
bundle exec rake db:seed
