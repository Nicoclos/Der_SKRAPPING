require 'nokogiri'   
require 'open-uri'

page= Nokogiri::HTML(URI.open("https://coinmarketcap.com/"))

# scraping name crypto
def crypto_name(page)
  name= page.xpath('//tr[*]/td[3]').collect(&:text)
end
  
# scraping price crypto
def crypto_price(page)
  page.xpath('//tr[*]/td[4]').collect(&:text)
end

name=crypto_name(page)
price = crypto_price(page)
puts tableau = Hash[name.zip(price)]
#will provide the hash with crypto names and values