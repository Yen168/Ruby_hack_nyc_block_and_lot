#!/usr/bin/ruby
 
require "uri"
require "net/http"
 
params = {'select_borough' => 4, 'text_block' => '01568', 'text_lot' => '0065'}
x = Net::HTTP.post_form(URI.parse('http://a836-acris.nyc.gov/CP/LookUp/Return'), params)
puts x.body


puts :emel

# Uncomment this if you want output in a file
# File.open('out.htm', 'w') { |f| f.write x.body }