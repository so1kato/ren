class AddAttachmentImage2ToTalents < ActiveRecord::Migration
  def self.up
    change_table :talents do |t|
      t.attachment :image2
    end
  end

  def self.down
    remove_attachment :talents, :image2
  end
end
