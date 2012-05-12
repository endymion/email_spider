require 'anemone'

ARGV.each do |url|
  Anemone.crawl(url) do |anemone|
    anemone.on_every_page do |page|
        puts page.url
    end
  end
end