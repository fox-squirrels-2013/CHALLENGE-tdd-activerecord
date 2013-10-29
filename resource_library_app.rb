require 'sinatra'
require 'sinatra/activerecord'

set :database, 'sqlite3:///db/resource_library.sqlite3'

class Topic < ActiveRecord::Base
  has_many :resources
  has_many :tags, :through => :topic_tags
  has_many :topic_tags
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
  belongs_to :tag
  belongs_to :topic
end

class Tag < ActiveRecord::Base
  has_many :topics, :through => :topic_tags
  has_many :topic_tags
  validates :name, :uniqueness => true, :presence => true
end

# validates syntax is object, type of validation
