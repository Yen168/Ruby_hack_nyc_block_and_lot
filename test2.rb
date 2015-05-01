#!/usr/bin/ruby
 
require "uri"
require "net/http"
 
params = {'find_type'=>"FindBBL",'select_borough' => 4, 'text_street_number' => '42-23', 'text_street_name' => 'GLEANE STREET'}
x = Net::HTTP.post_form(URI.parse('http://a836-acris.nyc.gov/CP/LookUp/Return'), params)
puts x.body
 
# Uncomment this if you want output in a file
# File.open('out.htm', 'w') { |f| f.write x.body }