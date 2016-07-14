class AddAttachmentImage1ToTalents < ActiveRecord::Migration
  def self.up
    change_table :talents do |t|
      t.attachment :image1
    end
  end

  def self.down
    remove_attachment :talents, :image1
  end
end
