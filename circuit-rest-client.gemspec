$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), 'lib'))

require 'circuit/version'

Gem::Specification.new do |s|
  s.name        = 'circuit'
  s.version     = Circuit::VERSION
  s.date        = '2020-03-20'
  s.summary     = 'Circuit Rest API client'
  s.description = 'Wrapper of the Circuit Rest API'
  s.authors     = ['Vincent Pochet']
  s.email       = 'vincent@elqano.com'
  s.files       = ['lib/circuit.rb']
  s.license     = 'MIT'

  s.add_development_dependency 'bundler', '~> 1.7'
  s.add_development_dependency 'rspec', '~> 3.1'
  s.add_development_dependency 'pry', '~> 0.10'
  s.add_development_dependency 'webmock'
  s.add_development_dependency 'sinatra'
end