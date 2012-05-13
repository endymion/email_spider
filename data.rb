require 'data_mapper' 

DataMapper.setup(:default, 'sqlite3:data.db')
DataMapper::Property::String.length(4096)

class Site
  include DataMapper::Resource

  property :id,         Serial
  property :created_at, DateTime
  property :host,       String

  has n, :addresses
  has n, :pages

  validates_presence_of :host
end

class Page
  include DataMapper::Resource

  property :id,         Serial
  property :created_at, DateTime
  property :url,        String

  belongs_to :site
  has n, :addresses

  validates_presence_of :url
end

class Address
  include DataMapper::Resource

  property :id,         Serial
  property :created_at, DateTime
  property :email,      String

  belongs_to :site
  belongs_to :page

  validates_presence_of :email
end

DataMapper.finalize
DataMapper.auto_upgrade!