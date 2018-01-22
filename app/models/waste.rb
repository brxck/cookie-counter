class Waste < ApplicationRecord
  belongs_to :item
  belongs_to :employee, foreign_key: :pin, primary_key: :pin

  validates :item_id, :quantity, presence: true
  validates :quantity, numericality: { only_integer: true,
                                       greater_than_or_equal_to: 0 }
end
