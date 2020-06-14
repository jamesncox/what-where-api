class Store < ApplicationRecord
    belongs_to :user
    has_many :items

    validates :name, presence: true
    validates :store_type, presence: true 
    validates :color, presence: true
end
