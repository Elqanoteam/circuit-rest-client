# Circuit REST API Ruby client

Wrapper of the Circuit Rest API

## Circuit Documentation

See the [circuit documentation](https://circuit.github.io/).

### Requirements

Ruby 2.0+.

### Bundler

``` ruby
source 'https://rubygems.org'

gem 'circuit'
```

### Configuration

The library needs to be configured with your account's secret key value:

``` ruby
require 'circuit'

Circuit.api_client_id = 'client id'
Circuit.api_client_secret = 'client secret'
Circuit.sandbox = true
Circuit.bearer_token = 'bearer token'
```

## Usage

Query for the list of webhooks:

```ruby
webhooks =  Circuit::Resources::Webhooks.all
webhooks.first.id
```

### Development

Run all tests:

    bundle exec rspec

