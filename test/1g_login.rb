require 'openssl'
require 'json'
require 'uri'
require "net/http"

IG_URI="https://demo-api.ig.com"

uri = URI.parse(IG_URI)
http = Net::HTTP.new(uri.host, uri.port)
http.use_ssl = true
#http.set_debug_output $stderr
#http.verify_mode = OpenSSL::SSL::VERIFY_NONE
request = Net::HTTP::Post.new("/gateway/deal/session")
request.add_field('Content-Type', 'application/json')
request.add_field('X-IG-API-KEY', '26305dc3f1100178cb53d9998f49541a85d7a8cb')
request.body = {"identifier"=> "demo-c2h2api","password"=> "123456"}.to_json
response = http.request(request)
puts response.body
