# AlgoApp

[AlgoApp](http://ec2-35-166-176-9.us-west-2.compute.amazonaws.com/posts) is a Ruby on Rails application that makes it easy to discover and share solutions to algorithms. Whether you are a developer or computer science major, AlgoApp is designed to help you improve your algorithm solutions by connecting to a community of eager learners.

## Setup

-Install [homebrew](https://brew.sh/)

-Install [rbenv](https://github.com/rbenv/rbenv#homebrew-on-mac-os-x) via homebrew.

```
$ rbenv install 2.3.1
$ rbenv local 2.3.1
$ gem install bundler
$ bundle install

-Install imagemagik

```
$ brew update
$ brew install imagemagick
```

- Database creation
  - `bundle exec rake db:migrate:reset`

## Start server

```
$ rails s
```

## Live Version

A live version of AlgoApp can be found [here](http://ec2-35-166-176-9.us-west-2.compute.amazonaws.com/posts). Sign up today to start learning and sharing.
