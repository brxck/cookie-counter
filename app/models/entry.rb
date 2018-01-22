class Entry < ApplicationRecord
  belongs_to :item
  belongs_to :user

  validates :in_stock, :on_order, :item_id, presence: true
  validates :in_stock, :on_order, numericality: { only_integer: true,
                                                  greater_than_or_equal_to: 0 }
end
