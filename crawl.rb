require 'anemone'

print 'Scanning'

addresses = []

ARGV.each do |url|
  Anemone.crawl(url) do |anemone|
    anemone.storage = Anemone::Storage.PStore('pages.pstore')
    anemone.on_every_page do |page|
      addresses << page.body.scan(/[\w\d]+[\w\d.-]@[\w\d.-]+\.\w{2,6}/)
      addresses = addresses.flatten.uniq
    end
  end
end

print "\n"
puts addresses.flatten.uniq