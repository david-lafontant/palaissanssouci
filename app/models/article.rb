class Article < ApplicationRecord
  belongs_to :user
  has_rich_text :content
  has_one_attached :poster

  validates :title, :slug, presence: true, length: { in: 6..300 }, uniqueness: true
  validates :poster, :poster_description, presence: true
  validate :validate_poster
  validates :content, presence: true

  private

  def validate_poster
    return unless poster.attached?

    errors.add(:poster, 'is too big, it shoulb be less than 1 MB') unless poster.blob.byte_size <= 1.megabyte
    acceptable_types = ['image/jpeg', 'image/png']
    return if acceptable_types.include?(poster.content_type)

    errors.add(:poster, 'must be a JPEG or PNG')
  end
end
