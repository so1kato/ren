class Admin::Administrator < ActiveRecord::Base
  SALT = 'xxxyyyzzz1234567890'
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :name,
    presence: { message: '名前を登録しください'}

  validates :email,
    presence: { message: 'メールアドレスを登録しください'},
    uniqueness: { message: '既に登録されています'},
    format: { with: VALID_EMAIL_REGEX, allow_blank: true, message: 'メールアドレスが不正です'}

  validates :password,
    presence: { on: :create, message: 'パスワードを登録しください'},
    confirmation: { message: 'パスワードが異なります'}

  before_save do
    if self.password.present?
      self.password = Administrator.crypt_password(self.password)
    else
      self.password = self.password_was
    end
  end

  def self.authenticate(email, password)
    user = find_by(email: email)
    if user != nil && user.password == self.crypt_password(password) then
      user
    else
      return
    end
  end

  def self.crypt_password(password)
    Digest::SHA1.hexdigest(SALT + password)
  end

end
