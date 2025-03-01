class Product < ApplicationRecord
  belongs_to :category
  has_many_attached :pictures
  has_many :line_items
  has_many :carts, through: :line_items
  validates_associated :line_items
  validate :correct_attachment_mime_type

  validates :name, :description, :price, :pictures, :category_id, presence: true
  validates :name, length: { in: 3..30 }, uniqueness: true
  validates :description, length: { in: 20..1000 }
  validates :price, numericality: { greater_than_or_equal_to: 0.01 }
  before_destroy :ensure_not_referenced_by_any_line_item

  private

  def ensure_not_referenced_by_any_line_item
    return if line_items.empty?

    errors.add(:base, 'Line Items present')
    throw :abort
  end

  def correct_attachment_mime_type
    pictures.each do |picture|
      errors.add(:pictures, 'Must be a JPEG or PNG file') unless picture.content_type.in?(%w[image/jpeg image/png])
      errors.add(:pictures, 'is too big, it shoulb be less than 2 MB') unless picture.blob.byte_size <= 2.megabytes
    end
  end
end
