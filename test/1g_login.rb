
require 'openssl'
require 'json'
require 'uri'
require "net/http"

IG_URI="https://demo-api.ig.com"
API_KEY='26305dc3f1100178cb53d9998f49541a85d7a8cb'
USER="demo-c2h2api"
PASS="123456"

uri = URI.parse(IG_URI)
http = Net::HTTP.new(uri.host, uri.port)
http.use_ssl = true
#http.set_debug_output $stderr
#http.verify_mode = OpenSSL::SSL::VERIFY_NONE
request = Net::HTTP::Post.new("/gateway/deal/session")
request.add_field('Content-Type', 'application/json')
request.add_field('X-IG-API-KEY', API_KEY)
request.body = {"identifier"=> USER,"password"=> PASS}.to_json
response = http.request(request)

cst=response["cst"]
xst=response["X-SECURITY-TOKEN"]

puts "###"
puts response.body


uri2 = URI.parse(IG_URI)
http = Net::HTTP.new(uri.host, uri.port)
http.use_ssl = true
request = Net::HTTP::Get.new("/gateway/deal/workingorders")
request.add_field('Content-Type', 'application/json')
request.add_field('X-IG-API-KEY', API_KEY)
request.add_field('CST', cst)
request.add_field('X-SECURITY-TOKEN', xst)
response = http.request(request)

puts "###"
puts response.body




