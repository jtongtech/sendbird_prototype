require 'sinatra'


# OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE

load './local_env.rb' if File.exist?('./local_env.rb')

enable :sessions

def authorize()
  redirect '/' if !(session[:email])
end
