# DataPublic
![logo](public/favicons/android-icon-144x144.png)
https://datapublic.kr

## About

DataPublic is raw data archives for important social issues and major public organization. We believe the importance of correct and public data to make people trust each other. And trust is the cornerstone to collaborate and decentralize power.

## Roadmap

https://github.com/parti-coop/datapublic/wiki

## How to Contribute

### Local Dev Setup

* [ruby](https://github.com/rbenv/rbenv)
    - check `ruby -v` matches `.ruby-version`
    - gem install bundler
    - bundle install
    - rails s 
* [postgres docker](https://hackernoon.com/dont-install-postgres-docker-pull-postgres-bee20e200198)
    - `docker run --rm --name postgres -d -p 5432:5432 -e POSTGRES_PASSWORD=docker -v $HOME/docker/volumes/postgres:/var/lib/postgresql/data postgres`
    - `psql -h localhost -U postgres -d postgres`
    - `CREATE DATABASE datapublic;`
    - ` bin/rails db:migrate RAILS_ENV=development`
    - 파일 세팅: .env.local
        ```
            DATABASE_HOST=127.0.0.1
            DATABASE_USERNAME=postgres
            DATABASE_PASSWORD=docker
        ```