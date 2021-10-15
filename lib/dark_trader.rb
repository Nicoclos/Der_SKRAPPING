require 'nokogiri'   
require 'open-uri'

page= Nokogiri::HTML(URI.open("https://coinmarketcap.com/"))
def crypto_name(page)
    # scraping name crypto
    name= page.xpath('//tr[*]/td[3]').collect(&:text)
    i=0
    j=1
    while i<name.length do
      j=j.to_s
      name[i]= name[i].gsub("Buy","")
      name[i] = name[i].gsub(j,"")
      j = j.to_i
      j+=1
      i+=1
    end
    name
  end
  
  def crypto_price(page)
    # scraping price crypto
   page.xpath('//tr[*]/td[4]').collect(&:text)
  end
  page= Nokogiri::HTML(URI.open("https://coinmarketcap.com/"))
  name=crypto_name(page)
  price = crypto_price(page)
  puts tableau = Hash[name.zip(price)]