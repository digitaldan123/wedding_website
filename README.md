# My first wedding website
An attempt to learn Ruby on Rails and avoid the typicaly mailing of invitations for my wedding.

## Prerequisite
* This app has only been tested with Rails5 and a Postgres SQL installation
* The following config is needed for development/production, an example in config/application.yml: 
```
defaults: &defaults
  MAP_APIS_KEY: <key from Google APIs> 

development:
  <<: *defaults
  DB_NAME: <database name>
  DB_USERNAME: <username>
  DB_PASSWORD: <password>
  DB_HOSTNAME: <hostname>
  DB_PORT: <port>
  SES_SMTP_USERNAME: <username for mail site>
  SES_SMTP_PASSWORD: <password for mail site>
  SES_ADDRESS: <mail site address>
  SES_PORT: <mail site port>
  EMAIL_ADDRESS: <email address for guests to reply to>
  SITE_URL: <url of the webiste to be used via emails and internal links>
  SECRET_KEY_BASE: <rails secret key, can be generated with "rails secret">
```

## Getting started
Below are some quick commands to get the site up and running

```
bundle install
rails db:setup
rails server
```

## Adding users via CSV
By going to the following url (available in the admin page) an admin can import a large amount of guests (additive to the existing guests)

site/import/index

A sample csv is provided in tests/stock_guests.csv
