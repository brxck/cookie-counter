class Employee < ApplicationRecord
  self.primary_key = :pin

  has_many :entries
  has_many :wastes

  validates :name, presence: true, uniqueness: true
end
