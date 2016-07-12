class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.integer :talent_id
      t.integer :job_category_id
      t.string :title
      t.string :cast
      t.boolean :bold_flg
      t.boolean :subtitle_flg
      t.boolean :display_flg
      t.integer :sort

      t.timestamps null: false
    end
  end
end
