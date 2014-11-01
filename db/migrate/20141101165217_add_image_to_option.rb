class AddImageToOption < ActiveRecord::Migration
  def self.up
    add_attachment :options, :content
  end

  def self.down
    remove_attachment :options, :content
  end
end
