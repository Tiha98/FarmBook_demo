class Field < ApplicationRecord
    validates :location_latitude, presence: true, numericality: { greater_than_or_equal_to: -90, less_than_or_equal_to: 90 }
    validates :location_longitude, presence: true, numericality: { greater_than_or_equal_to: -180, less_than_or_equal_to: 180 }
    validates :location_name, presence: true
    validates :size, numericality: { greater_than_or_equal_to: 0 }
    validates :fertilizer_type, presence: true, if: :fertilizer
    validates :leasing_end_date, presence: true, if: :leased
    has_many :notes, as: :noteable, dependent: :destroy
    belongs_to :user
end
