# Rails Engine

Rails Engine is meant to be the API back end of a Rails based E-commerce application. Rails Engine serves the front end (Rails Driver) by exposing various ReSTful and non-ReSTful endpoints, which return JSON formatted resource data.

## Getting Started
#### Prerequisites
While Rails Engine works as a standalone API, it was built to adhere to the spec harness included with Rails Driver. Follow the instructions [here](https://github.com/c-bartell/rails_driver) to install Rails Driver in the same directory as Rails Engine.
#### Installation
Begin by cloning this repo onto your local machine. If you plan to use Rails Driver as well, it may help to clone into an empty directory.
Once the project has been cloned, run the following to complete installation:
```
bundle install
bundle exec rake db:{create,migrate,seed}
```
## Running the test suite
The API itself includes an RSpec test sweet, which tests all included models and endpoints, and can be run via:
```
bundle exec rspec
```
#### Rails Driver Spec-Harness
Rails Drive also includes a spec-harness meant to test the back-end endpoints. To run the spec-harness, begin by starting the Rails Engine server. While in the `rails_engine` directory, run:
```
rails s
```
Next, move into the `rails_driver` directory (`rails_driver` and `rails_engine` must be located in the same directory for the spec harness to work), then run:
```
bundle exec rspec
```
Because the spec harness relies on hard coded id values in it's expectations, it is best to reset the `rails_engine` development database before each spec-harness run by running the following while in the `rails_engine` directory:
```
bundle exec rake db:{drop,create,migrate,seed}
```

## API Endpoints

## Built with
* Rails `5.2.4.3`
* Ruby `2.5.3`
* PostgreSQL 13

## Authors
* Rails Engine: Lovingly coded by Curtis Bartell [GitHub](https://github.com/c-bartell)|[Twitter](https://twitter.com/curtis_codes)|[LinkedIn](https://www.linkedin.com/in/curtis-bartell/)
* [Rails Driver](https://github.com/c-bartell/rails_driver) and [project requirements](https://backend.turing.io/module3/projects/rails_engine/): Turing School of Software and Design
