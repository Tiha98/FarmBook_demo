class Field < ApplicationRecord
    validates :location_latitude, presence: true, numericality: { greater_than_or_equal_to: -90, less_than_or_equal_to: 90 }
    validates :location_longitude, presence: true, numericality: { greater_than_or_equal_to: -180, less_than_or_equal_to: 180 }
    validates :location_name, presence: true
    validates :size, numericality: { greater_than_or_equal_to: 0 }
    validates :fertilizer_type, presence: true, if: :fertilizer
    validates :leasing_end_date, presence: true, if: :leased
    validate :sowing_date_cannot_be_in_the_future
    validate :harvest_date_cannot_be_in_the_past
    has_many :notes, as: :noteable, dependent: :destroy
    belongs_to :user

    private


    def sowing_date_cannot_be_in_the_future
        if sowing_date.present? && sowing_date > Date.current
          errors.add(:sowing_date, "can't be in the future")
        end
      end
    
      def harvest_date_cannot_be_in_the_past
        if harvest_date.present? && harvest_date < Date.current
          errors.add(:harvest_date, "can't be in the past")
        end
      end
end
