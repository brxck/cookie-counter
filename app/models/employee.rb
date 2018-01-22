class Employee < ApplicationRecord
  has_many :entries
  has_many :wastes
end
