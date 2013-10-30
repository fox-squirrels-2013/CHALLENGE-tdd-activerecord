require 'sinatra'
require 'sinatra/activerecord'

set :database, 'sqlite3:///db/resource_library.sqlite3'

class Topic < ActiveRecord::Base
  has_many :resources
  has_many :topic_tags
  has_many :tags, through: :topic_tags
  validates :name, :opinion, presence: true
  validates :opinion, length: { minimum: 10 }

  def tag_with!(tag)
    # IMPLEMENT ME
  end

  def add_resource!(resource)
    Resource.create(:topic_id => Topic.last[:id], :url => resource[:url], :difficulty => resource[:difficulty])
  end
end

class Resource < ActiveRecord::Base
  belongs_to :topic
  validates :url, :topic_id, presence: true
  validates_format_of :url, with: /http:\/{2}\w{2,}.{1}com/
  validates :topic_id, numericality: true
  validates :difficulty, inclusion: { :in => [:easy, :medium, :hard] }
end

class TopicTag < ActiveRecord::Base
  belongs_to :tag
  belongs_to :topic
end

class Tag < ActiveRecord::Base
  has_many :topics, through: :topic_tags
  has_many :topic_tags
  validates :name, uniqueness: true
end
