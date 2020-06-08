class Item < ApplicationRecord
    belongs_to: store
    has_one: user, through: store

    validates :name, presence: true
    validates :price, presence: true
    validates :quantity, presence: true
end
