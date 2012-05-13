require 'anemone'
require_relative 'data'

ARGV.each do |url|
  
  site = Site.first_or_create({ :url => url }, { :created_at => Time.now })
  
  Anemone.crawl(url) do |anemone|
    anemone.storage = Anemone::Storage.PStore('pages.pstore')
    anemone.on_every_page do |crawled_page|
      crawled_page.body.scan(/[\w\d]+[\w\d.-]@[\w\d.-]+\.\w{2,6}/).each do |address|
        if Address.first(:email => address).nil?
          page = Page.first_or_create(
            { :url => crawled_page.url.to_s },
            {
              :site => site,
              :created_at => Time.now
            }
          )
          Address.create(
            :email => address,
            :site => site,
            :page => page,
            :created_at => Time.now
          )
          puts address
        end
      end
    end
  end
end
