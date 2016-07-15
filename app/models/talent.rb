require 'csv'
class Talent < ActiveRecord::Base

  has_attached_file :image1,
    :url  => "/images/talents/:id/1.:extension",
    :path => "#{Rails.root}/public/images/talents/:id/1.:extension"

  has_attached_file :image2,
    :url  => "/images/talents/:id/2.:extension",
    :path => "#{Rails.root}/public/images/talents/:id/2.:extension"

  has_attached_file :pdf,
    :url  => "/images/pdf/:id/profile.pdf",
    :path => "#{Rails.root}/public/images/pdf/:id/profile.pdf"

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

  validates_attachment :image1,
    presence: { on: :create, message: '画像１を登録しください'},
    content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"], message: 'jpg画像を登録しください' }

  validates_attachment :image2,
    content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"], message: 'jpg画像を登録しください' }

  validates_attachment :pdf,
    content_type: { content_type: ["application/pdf"], message: 'pdfファイルを登録しください' }

end
