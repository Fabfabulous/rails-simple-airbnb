class Flat < ApplicationRecord
  has_many :bookings, dependent:   :destroy
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  has_one_attached :photo
  validates :name, :address, presence: true
end
