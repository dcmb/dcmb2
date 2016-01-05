DCMB
====

Contact [Andrew Bloomgarden](https://github.com/aughr) for any questions on how
this works.

To start
--------

This README is written under the assumption that you're using a Mac and have
[Homebrew](http://brew.sh/) installed.

Deploying
---------

First, install the [Heroku toolbelt](https://toolbelt.heroku.com/).

```bash
$ heroku login
# follow the instructions

# clone the repo
$ git clone git@github.com:dcmb/dcmb2.git

$ cd dcmb2
$ heroku git:remote -a dcmb2

# to deploy
$ git push heroku master
# you may have to use git push -f heroku to push to heroku if an error occurs
```

Running locally
---------------

0. Install postgres.

  ```bash
  brew install postgres
  ```

  Follow the instructions on running it that it spits out (also available via
  `brew info postgres`).

0. Install Ruby 2.1.4. I (Andrew) prefer rbenv:

  ```bash
  $ brew install rbenv ruby-build
  $ rbenv install 2.1.4
  ```
0. Get the gems the app uses:

  ```bash
  $ gem install bundler
  $ rbenv rehash
  $ bundle
  $ rbenv rehash
  ```
0. Create the database and migrate it:

  ```bash
  $ rake db:create db:migrate
  ```
0. Load the snapshot of the site stored in this repo:

  ```bash
  $ rake comfortable_mexican_sofa:fixtures:import FROM=dcmb TO=dcmb
  ```
0. Run the app:

  ```bash
  $ rails server
  ```
0. See it at [http://localhost:3000](http://localhost:3000)!

Moving data between development and production
----------------------------------------------

You can easily make changes locally and then move them into production.

BE CAREFUL. These methods wipe out _all_ data in the target and replace it with
whatever you load in.

```bash
$ rails server
# make tweaks in the UI
$ rake comfortable_mexican_sofa:fixtures:export FROM=dcmb TO=dcmb
$ git commit -a -m "Made changes"
$ git push origin master
$ git push heroku master
$ heroku run rake comfortable_mexican_sofa:fixtures:import FROM=dcmb TO=dcmb
```

Taking changes from production and loading them locally is a little trickier,
but totally doable:

```bash
$ heroku pgbackups:capture
$ curl -o latest.dump `heroku pgbackups:url`
$ pg_restore --verbose --clean --no-acl --no-owner -h localhost -U $USER -d dcmb_development latest.dump
```bash

See [Heroku's docs](https://devcenter.heroku.com/articles/heroku-postgres-import-export) for details.
