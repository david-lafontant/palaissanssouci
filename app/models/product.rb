class Product < ApplicationRecord
  belongs_to :category
  has_many_attached :pictures
  has_many :line_items
  has_many :carts, through: :line_items

  before_destroy :ensure_not_referenced_by_any_line_item

  private

  def ensure_not_referenced_by_any_line_item
    return if line_items.empty?

    errors.add(:base, 'Line Items present')
    throw :abort
  end
end
