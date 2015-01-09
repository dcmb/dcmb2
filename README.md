DCMB
====

Contact Andrew Bloomgarden via [GitHub messages](https://github.com/aughr) for
any questions on how this works.

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
$ heroku git remote:add -a dcmb2

# to deploy
$ git push heroku master
```

Running locally
---------------

0. Install postgres.

  ```bash
  brew install postgres
  ```

  Follow the instructions on running it that it spits out (also available via
  `brew info postgres`).

0. Install Ruby 2.1.2. I (Andrew) prefer rbenv:

  ```bash
  $ brew install rbenv ruby-build
  $ rbenv install 2.1.2
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
