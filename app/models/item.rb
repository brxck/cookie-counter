class Item < ApplicationRecord
  has_many :entries

  validates :name, :unit, :category, :value, presense: true
  validates :name, uniqueness: true
  validates :threshold, :value, numericality: numericality: { only_integer: true,
                                              greater_than_or_equal_to: 0 }
end
