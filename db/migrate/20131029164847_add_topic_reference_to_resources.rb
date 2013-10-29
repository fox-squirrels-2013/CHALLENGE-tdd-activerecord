# require_relative '../config'

class AddTopicReferenceToResources < ActiveRecord::Migration
  def change
    add_reference :resources, :topic, index: true
  end
end
