class Entry < ApplicationRecord
  belongs_to :item
  belongs_to :employee, foreign_key: :pin, primary_key: :pin

  validates :in_stock, :on_order, :item_id, presence: true
  validates :in_stock, :on_order, numericality: { only_integer: true,
                                                  greater_than_or_equal_to: 0 }

  after_create :update_item

  private

  def update_item
    item.update_attributes(in_stock: in_stock,
                           on_order: on_order,
                           low_stock: in_stock <= item.threshold)
  end
end
