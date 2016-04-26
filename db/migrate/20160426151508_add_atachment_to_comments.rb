class AddAtachmentToComments < ActiveRecord::Migration
    def self.up
    change_table :comments do |t|
      t.attachment :video
      t.attachment :image
      t.attachment :document
    end
  end

  def self.down
    remove_attachment :comments, :video
    remove_attachment :comments, :image
    remove_attachment :comments, :document
  end
end
