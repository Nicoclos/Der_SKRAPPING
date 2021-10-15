require_relative '../lib/mairie_christmas'
require 'nokogiri'   
require 'open-uri'
page = Nokogiri::HTML(URI.open("https://www.annuaire-des-mairies.com/val-d-oise.html"))

# describe "the townhall url method" do
#   it " return townhalls url and is not nil" do
#     expect(get_townhall_urls(townhall_url)).not_to('')
#   end
# end  

# describe "the townhall email method" do
#   it " return twonhalls emails and is not nil" do
#     expect(get_townhall_email()).not_to('')
#   end
# end  