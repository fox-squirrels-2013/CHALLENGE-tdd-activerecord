class CreateUrlOnResource < ActiveRecord::Migration
  def change
  	add_column :resources, :url, :string
  end
end
