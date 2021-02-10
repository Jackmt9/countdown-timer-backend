class User < ApplicationRecord
    has_secure_password
    has_many :timers
    validates_uniqueness_of :email
end
