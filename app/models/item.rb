class Item < ApplicationRecord
  has_many :entries
  has_many :wastes
  before_create :default_entry

  validates :name, :unit, :category, :value, presence: true
  validates :name, uniqueness: true
  validates :threshold, numericality: { only_integer: true,
                                        greater_than_or_equal_to: 0 }
  validates :value, numericality: { greater_than_or_equal_to: 0 }

  private

  def default_entry
    entries.build(in_stock: 0, on_order: 0, note: nil, pin: 0000).save
  end
end
