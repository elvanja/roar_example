# An example ecosystem around roar and roar-rails

## Idea

This is an example of a working ecosystem of services and client applications that interact using roar and roar-rails gems.
The main idea is to show how one might use those libraries to build such a system.

## Components

* book\_of\_orcharding - contains all the domain / business rules about fruit management
* orchard - serves us as the persistence layer for the orcharding rules
* tutti\_frutti - exposes orcharding rules as a json api
* smoothie\_mixer - rails project that consumes the api and delivers delishes fruit smoothies

## Run

start tutti\_frutti service by running: bundle exec rails s -p 9292

start smoothie\_mixer client by running: bundle exec rails s

that should be it :-)
