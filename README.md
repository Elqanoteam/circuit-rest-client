# Circuit RESP API Ruby client

## Circuit Documentation

See the [circuit documentation](https://circuit.github.io/).

### Requirements

* Ruby 2.0+.

### Bundler

If you are installing via bundler, you should be sure to use the https rubygems
source in your Gemfile, as any gems fetched over http could potentially be
compromised in transit and alter the code of gems fetched securely over https:

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

