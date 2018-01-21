class Waste < ApplicationRecord
  belongs_to :item
  belongs_to :user

  validates :item_id, :quantity, :user_id, presence: true
  validates :quantity, numericality: { only_integer: true,
                                       greater_than_or_equal_to: 0 }
end
