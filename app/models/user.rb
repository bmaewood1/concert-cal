class User < ApplicationRecord
    has_one :calendar

    has_secure_password
    validates :username, uniqueness: { case_sensitive: false }, presence: true
end
