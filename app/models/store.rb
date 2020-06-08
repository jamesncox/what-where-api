class Store < ApplicationRecord
    belongs_to: user
    has_many: items

    validates :name, presence: true
    validates :type, presence: true 
    validates :color, presence: true
end
