#!/usr/bin/ruby
 
require "uri"
require "open-uri"
require "net/http"
require 'nokogiri'
puts "1:M, 2:BZ, 3:BK, 4:Q, 5:SI: "
select_borough = gets.chomp
puts "street number: "
text_street_number = gets.chomp

puts "ST NAME: "
text_street_name = gets.chomp

puts "UNIT if APP: "
text_unit = gets.chomp

params = {'find_type'=>"FindBBL",'select_borough' => select_borough,'text_unit' => text_unit, 'text_street_number' => text_street_number, 'text_street_name' => text_street_name}
x = Net::HTTP.post_form(URI.parse('NYC B&L API'), params)
#puts x.body

doc = Nokogiri::HTML(x.body)
result = doc.xpath("//form/input")
#puts result
stockup = {}
result.each do |n|
	 stockup[n['name'].to_sym] = n['value']
end

stockup.each do |name,value|

	puts name.to_s+":"+value

end

#buliding_url = "Please drop me a mail to get more info. yenan.chen@gmail.com"

#bulid_doc = Nokogiri::HTML(open( buliding_url ))


# Uncomment this if you want output in a file
# File.open('out.htm', 'w') { |f| f.write x.body }