require 'sendbird'

load './local_env.rb' if File.exist?('./local_env.rb')

Sendbird.applications = {jeremy_jake_prototype: ENV['API_KEY']}
Sendbird.user = ENV['username']
Sendbird.password = ENV['password']
Sendbird.default_app = ENV['app_name']

user = Sendbird::User.new('testing_user_interface_1')
user.nickname('Yolo').profile_url('udbue').timezone('Europe/London').request!

# Sendbird.applications = {jeremy_jake_prototype: 'C4D85A32-DE9A-4196-A641-7DDDCCE59034'}
# Sendbird.user = 'heythrivydev3@gmail.com'
# Sendbird.password = 'Min3dMinds'
# Sendbird.default_app = 'jeremy_jake_prototype'