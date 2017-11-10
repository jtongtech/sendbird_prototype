require 'uri'
require 'net/http'
require 'openssl'

load './local_env.rb' if File.exist?('./local_env.rb')


url = URI("https://api.sendbird.com/v3/users/")

http = Net::HTTP.new(url.host, url.port)
http.use_ssl = true
http.verify_mode = OpenSSL::SSL::VERIFY_NONE

request = Net::HTTP::Get.new(url)
request["content-type"] = 'multipart/form-data; boundary=----WebKitFormBoundary7MA4YWxkTrZu0gW'
request["api-token"] = ENV['API_TOKEN']
request["authorization"] = 'Basic ' + ENV['authorization']
request["cache-control"] = 'no-cache'
request["postman-token"] = ENV["postman-token"]
request.body = "------WebKitFormBoundary7MA4YWxkTrZu0gW\r\nContent-Disposition: form-data; name=\"user_id\"\r\n\r\njohn123\r\n------WebKitFormBoundary7MA4YWxkTrZu0gW\r\nContent-Disposition: form-data; name=\"nickname\"\r\n\r\nJohnny\r\n------WebKitFormBoundary7MA4YWxkTrZu0gW\r\nContent-Disposition: form-data; name=\"profile_url\"\r\n\r\nhttps://sendbird.com/main/img/profiles/profile_05_512px.png\r\n------WebKitFormBoundary7MA4YWxkTrZu0gW\r\nContent-Disposition: form-data; name=\"issue_access_token\"\r\n\r\ntrue\r\n------WebKitFormBoundary7MA4YWxkTrZu0gW--"

response = http.request(request)
puts response.read_body