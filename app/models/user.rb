class User < ApplicationRecord

    before_create :confirmation_token
    before_save { self.email = email.downcase }
    validates :firstname, presence: true, length: { minimum: 3, maximum: 30 }
    validates :lastname, presence: true, length: { minimum: 1, maximum: 30 }
    VALID_EMAIL_REGEX = /\A([\w+\-]\.?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i 
    validates :email, presence: true, 
                      uniqueness: { case_sensitive: false }, 
                      length: { maximum: 100 },
                      format: { with: VALID_EMAIL_REGEX }
    has_secure_password

    def email_activate
        self.email_confirmed = true
        self.confirm_token = nil
        save!(:validate => false)
    end

    private

    def confirmation_token
        if self.confirm_token.blank?
            self.confirm_token = SecureRandom.urlsafe_base64.to_s
        end
    end

end