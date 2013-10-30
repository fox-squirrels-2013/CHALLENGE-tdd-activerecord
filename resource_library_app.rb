require 'sinatra'
require 'sinatra/activerecord'

set :database, 'sqlite3:///db/resource_library.sqlite3'

class Topic < ActiveRecord::Base
	validates :name, presence: true
	validates :opinion, presence: true
	validates :opinion, length: { minimum: 10 }
	has_many :resources
	has_many :topic_tags
	has_many :tags, through: :topic_tags

  def tag_with!(tag)
  	tag_hash = {}
  	tag_hash[:tag_id] = tag.id
  	TopicTag.create(tag_hash.merge(:topic_id => self.id))
  end

  def add_resource!(resource)
  	Resource.create(resource.merge(:topic_id => self.id))
  end
end

class Resource < ActiveRecord::Base
	validates :url, format: { with: /http:\/\// }
	validates :url, presence: true
	validates :topic_id, numericality: true
	validates :topic_id, presence: true 
	validates :difficulty, inclusion: { in: [:easy, :medium, :hard] }
	belongs_to :topic

end

class TopicTag < ActiveRecord::Base
	validates_uniqueness_of :topic_id, scope: :tag_id

end

class Tag < ActiveRecord::Base
	has_many :topic_tags
	has_many :topics, through: :topic_tags
	validates :name, uniqueness: true
	validates :name, presence: true

end
