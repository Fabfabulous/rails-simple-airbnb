class Flat < ApplicationRecord
  validates :name, :address, presence: true
end
