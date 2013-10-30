require 'sinatra'
require 'sinatra/activerecord'

set :database, 'sqlite3:///db/resource_library.sqlite3'

class Topic < ActiveRecord::Base
  validates :name, presence: true
  validates :opinion, presence: true, acceptance: 
                                     { accept: "A well thought out opinion on a subtle and nuanced topic", 
                                       not_accept: "Too short" }

  has_many :resources


  def tag_with!(tag)
    # IMPLEMENT ME
  end

  def add_resource!(resource)
    # IMPLEMENT ME
  end
end

class Resource < ActiveRecord::Base
  validates :url, presence: true, format: { with: /[http]/ }
  validates :topic_id, presence: true, numericality: true

  belongs_to :topic
end

class TopicTag < ActiveRecord::Base

end

class Tag < ActiveRecord::Base

end

  def validate(record)
    unless record.name.starts_with? 'X'
      record.errors[:name] << 'Need a name starting with X please!'
    end
  end
