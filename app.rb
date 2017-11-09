require 'sinatra'


OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE

load './local_env.rb' if File.exist?('./local_env.rb')

enable :sessions

api_headers = {'Api-Token': ENV['API_TOKEN']}

puts api_headers