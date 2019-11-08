class User < ApplicationRecord
    has_one :calendar

    validates :username, uniqueness: true
end
