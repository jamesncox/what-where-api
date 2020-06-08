class Item < ApplicationRecord
    belongs_to: store
    has_one: user, through: store
end
