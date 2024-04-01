class Zine < ApplicationRecord
    has_one_attached :cover_image
    has_one_attached :background_image
    
end
