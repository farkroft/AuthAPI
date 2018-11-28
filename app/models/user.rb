class User < ApplicationRecord
    # Necessary to authenticate.
    has_secure_password

    # Basic password validation, configure to your liking
    validates_length_of :password, maximun: 72, minimun: 8, allow_nil: true, allow_blank: false
    validates_confirmation_of :password, allow_nil: true, allow_blank: false

    before_validation {
        (self.email = self.email.to_s.downcase) && (self.username = self.username.to_s.downcase)
    }

    validates_presence_of :email
    validates_presence_of :username
    validates_uniqueness_of :email
    validates_uniqueness_of :username

    # method untuk mengecek apakah user diberi akses untuk mengedit
    def can_modify_user?(user_id)
      role == 'admin' || id.to_s == user_id.to_s
    end

    # method untuk mengecek user tsb admin atau tidak
    def is_admin?
        role == 'admin'
    end
end
