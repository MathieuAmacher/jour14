require 'rubygems'
require 'nokogiri'
require 'open-uri'

page = Nokogiri::HTML(URI.open("https://coinmarketcap.com/all/views/all/"))   
puts page.class   # => Nokogiri::HTML::Document


crypto_name_path = page.xpath('//td[contains(@class, "symbol")]').map(&:text).uniq
crypto_value_path = page.xpath('//td[contains(@class, "price")]').map(&:text).uniq

crypto_name =  []
crypto_name_path.each do |title|
    crypto_name << title
end

crypto_value = []
crypto_value_path.each do |price|
    crypto_value << price
end

crypto_table =[]
crypto_table = crypto_name.zip(crypto_value).to_h
crypto_table.each{|key, value|
puts "#{key} => #{value}"}











