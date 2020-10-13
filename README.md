# CNAB Reader by Henrique

This application aims to process a CNAB file and save the information correctly in the database.

## Requirements
  - Ruby 2.5.1
  - Rails 6.0.3
  - Postgres

## Getting started

First of all, you need to clone the project into your local machine and enter in the project's folder.

```bash
git clone git@github.com:henriquenm/credere.git
cd credere
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
  database: credere_development

test:
  <<: *default
  database: credere_test
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

## CNAB documentation

| Descrição do campo  | Inicio | Fim | Tamanho | Comentário
| ------------- | ------------- | -----| ---- | ------
| Tipo  | 1  | 1 | 1 | Tipo da transação
| Data  | 2  | 9 | 8 | Data da ocorrência
| Valor | 10 | 19 | 10 | Valor da movimentação. *Obs.* O valor encontrado no arquivo precisa ser divido por cem(valor / 100.00) para normalizá-lo.
| CPF | 20 | 30 | 11 | CPF do beneficiário
| Cartão | 31 | 42 | 12 | Cartão utilizado na transação 
| Hora  | 43 | 48 | 6 | Hora da ocorrência atendendo ao fuso de UTC-3
| Dono da loja | 49 | 62 | 14 | Nome do representante da loja
| Nome loja | 63 | 81 | 19 | Nome da loja

## Transaction Types

| Tipo | Descrição | Natureza | Sinal |
| ---- | -------- | --------- | ----- |
| 1 | Débito | Entrada | + |
| 2 | Boleto | Saída | - |
| 3 | Financiamento | Saída | - |
| 4 | Crédito | Entrada | + |
| 5 | Recebimento Empréstimo | Entrada | + |
| 6 | Vendas | Entrada | + |
| 7 | Recebimento TED | Entrada | + |
| 8 | Recebimento DOC | Entrada | + |
| 9 | Aluguel | Saída | - |