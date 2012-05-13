require 'csv'
require_relative 'data'

task :export do
  
  CSV.open("addresses.csv", "wb") do |csv|
    csv << ["address", "time", "host", "page"]
    
    Address.each do |address|
      csv <<
        [
          address.email,
          address.created_at.strftime('%a %b %e %Y %I:%M:%S %p'),
          address.site.host,
          address.page.url
        ]
    end
  end
  
  puts "#{Address.count} addresses exported to addresses.csv"
  
end