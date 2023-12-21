Блог с регистрацией, личным кабинетом, постами(crud), и реакциями зарегестрированых пользователей

как я это поднимал:

$ touch Gemfile

source 'https://rubygems.org'
gem 'rails', '~>5'

#Create an empty Gemfile.lock file to build our Dockerfile.

$ touch Gemfile.lock

#Build the project

docker compose run --no-deps web rails new . --force --database=postgresql
docker compose build

#Replace the contents of config/database.yml with the following:

default: &default
  adapter: postgresql
  encoding: unicode
  host: db
  username: postgres
  password: password
  pool: 5

development:
  <<: *default
  database: myapp_development


test:
  <<: *default
  database: myapp_test

docker compose up
docker compose run web rake db:create
