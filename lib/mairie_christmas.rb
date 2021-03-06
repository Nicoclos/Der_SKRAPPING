require 'nokogiri'   
require 'open-uri'

def get_townhall_urls(townhall_url)
 townhall_url.xpath('/html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]').collect(&:text)
end
#nokogiri will go on cities's urls and get the information I indicated to it

def get_townhall_email()
  city = []
  email = []
  page = Nokogiri::HTML(URI.open("https://www.annuaire-des-mairies.com/val-d-oise.html"))
  townhall_urls =page.xpath('//tr//a[@class="lientxt"]/@href').collect(&:text)
  #nokogiri will take every links for every cities of the department
  townhall_urls.each do |url|
    url_open= "https://www.annuaire-des-mairies.com/"+ url.gsub("./","")
    url_open =Nokogiri::HTML(URI.open(url_open))  
    email << get_townhall_urls(url_open)
    url =url.gsub("./","")
    url =url.gsub(".html","")
    url =url.gsub("95/","")
    city<<url
  end
  puts tableau = Hash[city.zip(email)]
  #informations will be contained in the newly created hash !
end

def play()
  puts "start scraping"
  puts "annuaire-des-mairies.com/val-d-oise"
  get_townhall_email()
end
play()
#let's rock these emails !