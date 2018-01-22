class Employee < ApplicationRecord
  has_many :entries
  has_many :wastes

  validates :name, :pin, presence: true, uniqueness: true
end
