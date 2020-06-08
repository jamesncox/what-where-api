class User < ApplicationRecord
    has_many: stores
    has_many: items, through: stores 
end
