class Article < ApplicationRecord
    has_rich_text :content
    has_one_attached :cover_photo
end
