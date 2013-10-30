class IncludeTopicInResources < ActiveRecord::Migration
  def change
  	add_reference :resources, :topic, index:true
  end
end
