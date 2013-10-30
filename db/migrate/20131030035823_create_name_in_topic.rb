class CreateNameInTopic < ActiveRecord::Migration
  def change
  	add_column :topics, :name, :string
  end
end
