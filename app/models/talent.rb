class Talent < ActiveRecord::Base

  validates :display_flg,
    presence: { message: '表示・非表示を選択しください'}

  validates :category_id,
    presence: { message: 'カテゴリを選択しください'}

  validates :code,
    presence: { message: 'タレントIDを登録しください'},
    uniqueness: { message: '既に登録されています'}

  validates :name,
    presence: { message: '名前を登録しください'}

  validates :name_kana,
    presence: { message: '名前（ふりがな）を登録しください'}

  validates :name_eng,
    presence: { message: '名前（English）を登録しください'}

  validates :birth_month,
    presence: { message: '誕生月を選択しください'}

  validates :birth_day,
    presence: { message: '誕生日を選択しください'}

  validates :prefecture_id,
    presence: { message: '出身地を選択しください'}

  validates :url_hp,
    format: { with: /(^$)|(^(http|https):\/\/[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(([0-9]{1,5})?\/.*)?$)/ix, allow_blank: true, message: 'URLを登録しください' }

  validates :url_blog,
    format: { with: /(^$)|(^(http|https):\/\/[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(([0-9]{1,5})?\/.*)?$)/ix, allow_blank: true, message: 'URLを登録しください' }

  validates :url_tw,
    format: { with: /(^$)|(^(http|https):\/\/[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(([0-9]{1,5})?\/.*)?$)/ix, allow_blank: true, message: 'URLを登録しください' }

  validates :url_fb,
    format: { with: /(^$)|(^(http|https):\/\/[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(([0-9]{1,5})?\/.*)?$)/ix, allow_blank: true, message: 'URLを登録しください' }

  validates :url_ins,
    format: { with: /(^$)|(^(http|https):\/\/[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(([0-9]{1,5})?\/.*)?$)/ix, allow_blank: true, message: 'URLを登録しください' }

end
