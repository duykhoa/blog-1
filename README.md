### README
This is the readme tutorial

Follow this to install the source code to your machine

1. Install the code to machine

  - grant execute mode to ``init``
    Go inside the project (ex: ``cd ~/working/blog``)
    `` chmod +x init ``

    Basicly it's a init script, write by shell script

  - Run the script by calling ``./init``
  It takes a little bit of time to finish.
  You will be asked to edit the ``database.yml`` and ``application.yml``
  you press 0 for NO, 1 for YES and press enter.

  Basicly, the database.yml looks like:

  ```
  default: &default
    adapter: postgresql
    pool: 5
    timeout: 5000
    encoding: utf8
    reconnect: false
    username: <YOURNAME>
    password: <PASSWORD>
    host: localhost

  development:
    <<: *default
    database: DATABASE_NAME

  # Warning: The database defined as "test" will be erased and
  # re-generated from your development database when you run "rake".
  # Do not set this db to the same as development or production.
  test:
    <<: *default
    database: DATABASE_NAME

  production:
    <<: *default
    database: DATABASE_NAME
  ```

  It uses postgreSQL, so you need to install PostgreSQL before use.

  If you use OSX, I suggest to use [Postgres
  app](http://postgresapp.com/), it's very cool app for postgres.

  And the application.yml looks like this

  ```
  production:
    access_key_id: 456
    secret_access_key: 456
    bucket: "xxx"
  ```

  It is the config key for S3, you can go to amazon.com/s3, then view
  your account credential to get these information.

  No need to setup it on the local machine (for development env), cause
  it won't access to S3 from development any more :)

  Then after finish config these 2 files, you can press any key and
  enter, the script will run bundle install, create database, migrate
  and seed database.

  Finally it'll start the server after finish these thing, very cool.

  If you are an zsh user, you can create an alias in ``.zshrc``o
  ``alias blog="cd ~/workspace/blog && ./init"``

1. Admin mode

  Visit localhost:3000/admin
  Default admin account is
  
  **email/password: admin@admin.com/12341234**
  
  You can change the password and the email in the admin/users page
  
  In the admin/articles page, you can select multiple articles and do
  batches actions (delete selected articles), you can filter by multiple
  fields like title, published date, category.
  
  In the post page, I used tinymce editor plugin, it's very nice to edit your article there.
  
  Just simple like that :) Hope everything work
  
1. Feedback
1. Contributor

  
  
