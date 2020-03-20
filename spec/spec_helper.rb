require 'bundler/setup'
Bundler.setup

require 'circuit_api'
require 'webmock/rspec'
require 'sinatra'
require 'pry'

Dir.glob(File.expand_path('../support/**/*.rb', __FILE__), &method(:require))

RSpec.configure do |config|
  config.before(:each) do
    WebMock.stub_request(:any, /rest\/v2/).to_rack(CircuitFaker)
  end
end
