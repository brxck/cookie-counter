class Item < ApplicationRecord
  has_many :entries

  validates :name, :unit, :category, :value, presence: true
  validates :name, uniqueness: true
  validates :threshold, :value, numericality: { only_integer: true,
                                                greater_than_or_equal_to: 0 }

  def in_stock
    return unless entries.any?
    entries.last.quantity
  end

  def on_order
    return unless entries.any?
    entries.last.on_order
  end

  def updated_by
    # TODO: Add data to user model.
    # entries.last.user.initials
  end

  def last_updated
    return unless entries.any?
    entries.last.updated_at
  end
end
