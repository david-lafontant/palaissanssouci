class Article < ApplicationRecord
  belongs_to :user
  has_rich_text :content
  has_one_attached :poster
end
