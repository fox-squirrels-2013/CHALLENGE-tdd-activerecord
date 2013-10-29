class TopicsAssociateResources < ActiveRecord::Migration
  def change
    add_reference :resources, :topic
  end
end
