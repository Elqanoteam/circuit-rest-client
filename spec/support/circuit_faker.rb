require 'sinatra/base'

Dir[File.dirname(__FILE__) + '/fakers/*.rb'].each { |file| require_relative file }

class CircuitFaker < Sinatra::Base
  set :show_exceptions, false

  not_found do
    status 404
    error = env['sinatra.error']
    url = request.url
    backtrace = "Application error\n#{error}\n#{error.backtrace.join("\n")}"
    {
      message: error.message,
      path: url,
      timestamp: Time.new,
      backtrace: backtrace
    }.to_json
  end

  error do
    status 500
    error = env['sinatra.error']
    url = request.url
    backtrace = "Application error\n#{error}\n#{error.backtrace.join("\n")}"

    {
      message: error.message,
      path: url,
      timestamp: Time.new,
      backtrace: backtrace
    }.to_json
  end

  private

  def json_response(status, path)
    status status
    content_type :json
    IO.read("spec/fixtures/#{path}.json")
  end

  def blank_response(status)
    status status
    content_type :json
    ''
  end
end
