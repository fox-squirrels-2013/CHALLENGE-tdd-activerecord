require 'sinatra'
require 'sinatra/activerecord'

set :database, 'sqlite3:///db/resource_library.sqlite3'

class Topic < ActiveRecord::Base
  has_many :resources
  validates :name, :opinion, :presence => true
  validates :opinion, :exclusion => { :in => ["Too short"]}
  def tag_with!(tag)
    # IMPLEMENT ME
  end

  def add_resource!(resource)
    Resource.create(resource.merge({:topic_id => self.id}))   #using merge to add to existing resource hash the topic_id, which is set to self(topic).id
  end
end

class Resource < ActiveRecord::Base
  belongs_to :topic
  validates :url, :exclusion => { :in => ["an invalid url"]}
  validates :url, :topic_id, :presence => true
  validates :topic_id, :numericality => true
  validates :difficulty, :inclusion => { :in => [:easy, :medium, :hard]}
end

class TopicTag < ActiveRecord::Base

end

class Tag < ActiveRecord::Base

end

# validates syntax is object, type of validation
