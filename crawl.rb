require 'anemone'

print 'Scanning'

addresses = []

ARGV.each do |url|
  Anemone.crawl(url) do |anemone|
    anemone.on_every_page do |page|
      addresses << page.body.scan(/[\w\d]+[\w\d.-]@[\w\d.-]+\.\w{2,6}/)
      addresses = addresses.flatten.uniq
      print '.'
    end
  end
end

print "\n"
puts addresses.flatten.uniq