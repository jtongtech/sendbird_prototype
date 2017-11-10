require 'net/http'
require 'uri'

uri = URI.parse("https://api.sendbird.com/v3/users")
request = Net::HTTP::Get.new(uri)
request["Api-token"] = "3a419a74a2e469defe7e540fc9c088c47cba8075"

req_options = {
    use_ssl: uri.scheme == "https",
}

response = Net::HTTP.start(uri.hostname, uri.port, req_options) do |http|
    http.request(request)
end

puts response.code
puts response.body
