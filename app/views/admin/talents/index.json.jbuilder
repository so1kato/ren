json.array!(@talents) do |talent|
  json.extract! talent, :id, :name, :code, :name_kana, :name_eng, :category_id, :birth_month, :birth_day, :prefecture_id, :hometown, :hobby, :url_hp, :url_blog, :url_tw, :url_fb, :url_ins, :masterpiece, :voice_mix, :voice_line_1, :voice_line_2, :voice_line_3, :voice_line_4, :voice_narration_1, :voice_narration_2, :voice_narration_3, :voice_narration_4, :voice_talk_1, :voice_talk_2, :voice_talk_3, :voice_talk_4, :voice_other_1, :voice_other_2, :voice_other_3, :voice_other_4, :display_flg, :deleted
  json.url admin_talent_url(talent, format: :json)
end
