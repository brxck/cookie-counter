class Item < ApplicationRecord
  has_many :entries
  before_create :default_entry

  validates :name, :unit, :category, :value, presence: true
  validates :name, uniqueness: true
  validates :threshold, numericality: { only_integer: true,
                                        greater_than_or_equal_to: 0 }
  validates :value, numericality: { greater_than_or_equal_to: 0 }

  def current
    entries.last
  end

  def default_entry
    entries.build(in_stock: 0, on_order: 0, note: nil, employee_id: 1).save
  end
end
