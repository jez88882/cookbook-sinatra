class ScrapeAllrecipesService
  def initialize(keyword)
    @keyword = keyword
  end

  def call
    # TODO: return a list of `Recipes` built from scraping the web.
    url = "https://www.allrecipes.com/search/results/?search=#{@keyword}"
    doc = Nokogiri::HTML(URI.open(url).read, nil, 'utf-8')
    results = doc.search('.card__titleLink').map do |element|
      binding.pry
      [element.attribute('title').value, element.attribute('href').value]
    end
    results.uniq.first(5)
  end
end
