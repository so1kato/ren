class CreateAdminTalents < ActiveRecord::Migration
  def change
    create_table :admin_talents do |t|
      t.string :name
      t.string :code
      t.string :name_kana
      t.string :name_eng
      t.integer :category_id
      t.integer :birth_month
      t.integer :birth_day
      t.integer :prefecture_id
      t.string :hometown
      t.text :hobby
      t.string :url_hp
      t.string :url_blog
      t.string :url_tw
      t.string :url_fb
      t.string :url_ins
      t.text :masterpiece
      t.string :voice_mix
      t.string :voice_line_1
      t.string :voice_line_2
      t.string :voice_line_3
      t.string :voice_line_4
      t.string :voice_narration_1
      t.string :voice_narration_2
      t.string :voice_narration_3
      t.string :voice_narration_4
      t.string :voice_talk_1
      t.string :voice_talk_2
      t.string :voice_talk_3
      t.string :voice_talk_4
      t.string :voice_other_1
      t.string :voice_other_2
      t.string :voice_other_3
      t.string :voice_other_4
      t.boolean :display_flg
      t.datetime :deleted

      t.timestamps null: false
    end
  end
end
