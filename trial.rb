require 'uri'
require 'net/http'
require 'openssl'


url = URI("https://api.sendbird.com/v3/users/")

http = Net::HTTP.new(url.host, url.port)
http.use_ssl = true
http.verify_mode = OpenSSL::SSL::VERIFY_NONE

request = Net::HTTP::Get.new(url)
request["content-type"] = 'multipart/form-data; boundary=----WebKitFormBoundary7MA4YWxkTrZu0gW'
request["api-token"] = '3a419a74a2e469defe7e540fc9c088c47cba8075'
request["authorization"] = 'Basic aGV5dGhyaXZ5ZGV2M0BnbWFpbC5jb206TWluM2RNaW5kcw=='
request["cache-control"] = 'no-cache'
request["postman-token"] = '61a29fa6-aeee-f61e-30d1-6ba8c4f47c69'
request.body = "------WebKitFormBoundary7MA4YWxkTrZu0gW\r\nContent-Disposition: form-data; name=\"user_id\"\r\n\r\njohn123\r\n------WebKitFormBoundary7MA4YWxkTrZu0gW\r\nContent-Disposition: form-data; name=\"nickname\"\r\n\r\nJohnny\r\n------WebKitFormBoundary7MA4YWxkTrZu0gW\r\nContent-Disposition: form-data; name=\"profile_url\"\r\n\r\nhttps://sendbird.com/main/img/profiles/profile_05_512px.png\r\n------WebKitFormBoundary7MA4YWxkTrZu0gW\r\nContent-Disposition: form-data; name=\"issue_access_token\"\r\n\r\ntrue\r\n------WebKitFormBoundary7MA4YWxkTrZu0gW--"

response = http.request(request)
puts response.read_body