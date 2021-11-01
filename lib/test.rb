require 'nokogiri'
require 'open-uri'

keyword = "strawberry"
url = "https://www.allrecipes.com/search/results/?search=#{keyword}"
    doc = Nokogiri::HTML(URI.open(url).read, nil, 'utf-8')
    results = doc.search('.card__titleLink').map do |element|
      [element.attribute('title').value, element.attribute('href').value]
    end
   p results.uniq.first(5)
