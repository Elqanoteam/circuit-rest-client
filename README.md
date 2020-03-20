# Circuit REST API Ruby client

Wrapper of the Circuit Rest API

## Circuit Documentation

See the [circuit documentation](https://circuit.github.io/).

### Requirements

Ruby 2.0+.

### Bundler

``` ruby
source 'https://rubygems.org'

gem 'circuit-api'
```

### Configuration

The library needs to be configured with your account's secret key value:

``` ruby
require 'circuit'

Circuit::Client.new(
    client_id: 'client id',
    client_secret: 'client secret',
    sandbox: true
)

client.connect('oauth token')
```

## Usage

Query for the list of webhooks:

```ruby
webhooks =  client.webhooks.all
webhooks.first.id
```

### Development

Run all tests:

    bundle exec rspec

