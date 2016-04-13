class CreateAddAttachmentVideoToComments < ActiveRecord::Migration
    def self.up
    change_table :comments do |t|
      t.attachment :video
    end
  end

  def self.down
    remove_attachment :comments, :video
  end
end
