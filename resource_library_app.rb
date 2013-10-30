require 'sinatra'
require 'sinatra/activerecord'

set :database, 'sqlite3:///db/resource_library.sqlite3'

class Topic < ActiveRecord::Base
  has_many :resources
  validates :name, :opinion, presence: true
  validates :opinion, length: { minimum: 10 }

  def tag_with!(tag)
    # IMPLEMENT ME
  end

  def add_resource!(resource)
    # IMPLEMENT ME
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

end

class Tag < ActiveRecord::Base

end
