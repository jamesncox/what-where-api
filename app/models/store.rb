class Store < ApplicationRecord
    belongs_to :user
    has_many :items

    validates :name, presence: { message: "%{value} of store is missing" }
    validates :store_type, presence: { message: "%{value} is missing" }
    validates :color, presence: { message: "%{value} of header not selected" }
end
