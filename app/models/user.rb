class User < ApplicationRecord
    has_one :calendar

    has_secure_password
    validates :username, uniqueness: { case_sensitive: false }, presence: true

    def full_name
        "#{self.first_name} #{self.last_name}"
    end
end
