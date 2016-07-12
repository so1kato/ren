class CreateJobCategories < ActiveRecord::Migration
  def change
    create_table :job_categories do |t|
      t.integer :talent_id
      t.string :name
      t.boolean :display_flg
      t.integer :sort

      t.timestamps null: false
    end
  end
end
