require_relative '../lib/dark_trader'
require 'nokogiri'   
require 'open-uri'
page = Nokogiri::HTML(URI.open("https://coinmarketcap.com/"))


describe "the crypto name method" do
  it " return crypto's symbol and crypto is not nil" do
    expect(crypto_name(page)).not_to be_nil
  end
end  

describe "the crypto price method" do
  it " return crypto's price and crypto is not nil" do
    expect(crypto_price(page)).not_to be_nil
  end
end  