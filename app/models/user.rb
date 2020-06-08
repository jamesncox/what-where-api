class User < ApplicationRecord
    has_many: stores
    has_many: items, through: stores 

    has_secure_password
    validates :username, presence: true, uniqueness: true
    validates :password_confirmation, presence: true, on: :create
end
