$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), 'lib'))

require 'circuit_api/version'

Gem::Specification.new do |s|
  s.name        = 'circuit-api'
  s.version     = CircuitApi::VERSION
  s.date        = '2020-03-20'
  s.summary     = 'Circuit Rest API client'
  s.description = 'Wrapper of the Circuit Rest API'
  s.authors     = ['Vincent Pochet']
  s.email       = 'vincent@elqano.com'
  s.homepage    = 'https://github.com/Elqanoteam/circuit-rest-client'
  s.license     = 'MIT'

  s.files         = `git ls-files lib`.split("\n")
  s.require_paths = ['lib']

  s.add_development_dependency 'bundler', '~> 1.7'
  s.add_development_dependency 'rspec', '~> 3.1'
  s.add_development_dependency 'byebug', '~> 11.1.3'
  s.add_development_dependency 'webmock', '~> 3.10.0'
  s.add_development_dependency 'sinatra', '~> 3.0.4'
end
