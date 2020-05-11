class User < ApplicationRecord
    before_save { self.email = email.downcase }
    validates :firstname, presence: true, length: { minimum: 3, maximum: 30 }
    validates :lastname, presence: true, length: { minimum: 1, maximum: 30 }
    VALID_EMAIL_REGEX = /\A([\w+\-]\.?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i 
    validates :email, presence: true, 
                      uniqueness: { case_sensitive: false }, 
                      length: { maximum: 100 },
                      format: { with: VALID_EMAIL_REGEX }
    has_secure_password

end