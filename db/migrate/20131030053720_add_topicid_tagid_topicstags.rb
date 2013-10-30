class AddTopicidTagidTopicstags < ActiveRecord::Migration
  def change
  	add_column :topic_tags, :topic_id, :integer
  	add_column :topic_tags, :tag_id, :integer
  end
end
