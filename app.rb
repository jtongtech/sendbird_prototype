require 'sinatra'
require 'sendbird'

OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE

load './local_env.rb' if File.exist?('./local_env.rb')

enable :sessions

Sendbird.applications = {app_name: ENV['API_KEY']}
Sendbird.user = ENV['username']
Sendbird.password = ENV['password']
Sendbird.default_app = ENV['app_name']

def authorize()
  redirect '/' if !(session[:email])
end