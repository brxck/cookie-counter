class Entry < ApplicationRecord
  belongs_to :item
  belongs_to :employee

  validates :in_stock, :on_order, :item_id, presence: true
  validates :in_stock, :on_order, numericality: { only_integer: true,
                                                  greater_than_or_equal_to: 0 }

  after_save :toggle_low_stock

  private

  def toggle_low_stock
    item.update_attribute('low_stock', in_stock <= item.threshold)
  end
end
