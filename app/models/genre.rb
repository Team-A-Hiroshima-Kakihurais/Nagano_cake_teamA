class Genre < ApplicationRecord
    #大量のアイテムを持つ(genre:item = 1:N)
    has_many :items
end
