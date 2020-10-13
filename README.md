# Desafio Ruby on Rails - ByCoders CNAB Reader by Henrique

This application aims to process a CNAB file and save the information correctly in the database.

## Requirements
  - Ruby 2.5.1
  - Rails 6.0.3
  - Postgres

## Getting started

First of all, you need to clone the project into your local machine and enter in the project's folder.

```bash
git clone git@github.com:henriquenm/desafio-ruby-on-rails.git
cd desafio-ruby-on-rails/bycoders-cnab-reader
```

Now, run bundler to install all project's gems and dependencies.

```bash
bundle install
```

If necessary run the following command to update your Yarn packages.

```bash
yarn install --check-files
```

Configure the 'database.yml' to create database. Example:

```yml
default: &default
  adapter: postgresql
  encoding: unicode
  pool: <%= ENV.fetch("RAILS_MAX_THREADS") { 5 } %>
  timeout: 5000

development:
  <<: *default
  database: bycoders_development

test:
  <<: *default
  database: bycoders_test
```

After database configuration file is created, run the following commands to create database and run migrations.

```bash
rake db:create
rake db:migrate
```

Run the command below to create all Transaction Types.

```bash
rake populate:transaction_type
```

And it's done! Run the rails server to test it on http://localhost:3000/

```bash
rails s
```

## API

You can import CNAB file and consult records through API.

```bash
curl http://localhost:3000/api/v1/stores #return stores
curl http://localhost:3000/api/v1/stores/:id #return store transactions
curl -F 'import_file=@path/to/CNAB.txt' http://localhost:3000/api/v1/transactions/import #import CNAB file and return stores
```

## Running Tests

You can run rspec tests by typing

```bash
rspec
```

And see coverage with simplecov

```bash
open coverage/index.html
```
