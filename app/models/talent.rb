require 'csv'
class Talent < ActiveRecord::Base

  has_attached_file :image1
  has_attached_file :image2
  has_attached_file :pdf
#  has_attached_file :image1, styles: { medium: "300x300>", thumb: "100x100>" }

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

  validates_attachment :image1, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] }
  validates_attachment :image2, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] }
  validates_attachment :pdf, content_type: { content_type: ["application/pdf"] }
end
