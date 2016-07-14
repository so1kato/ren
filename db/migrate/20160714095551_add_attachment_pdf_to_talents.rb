class AddAttachmentPdfToTalents < ActiveRecord::Migration
  def self.up
    change_table :talents do |t|
      t.attachment :pdf
    end
  end

  def self.down
    remove_attachment :talents, :pdf
  end
end
