class Booking < ApplicationRecord
  belongs_to :flat
  validates :name, :start_date, :end_date, presence: true
end
