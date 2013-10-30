require 'sinatra'
require 'sinatra/activerecord'

set :database, 'sqlite3:///db/resource_library.sqlite3'

class Topic < ActiveRecord::Base
	validates :name, presence: true
	validates :opinion, presence: true
	validates :opinion, length: { minimum: 10 }
	has_many :resources

  def tag_with!(tag)
    # IMPLEMENT ME
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

end

class Tag < ActiveRecord::Base
	

end
