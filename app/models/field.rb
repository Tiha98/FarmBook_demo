class Field < ApplicationRecord
    validates :name, presence: true     
    validates :location_latitude, presence: true, numericality: { greater_than_or_equal_to: -90, less_than_or_equal_to: 90 }
    validates :location_longitude, presence: true, numericality: { greater_than_or_equal_to: -180, less_than_or_equal_to: 180 }
    validates :location_name, presence: true
    validates :size, numericality: { greater_than_or_equal_to: 1 }
    validates :fertilizer_type, presence: true, if: :fertilizer
    validates :fertilizer_usage, presence: true, if: :fertilizer
    validates :leasing_end_date, presence: true, if: :leased
    validate :sowing_date_cannot_be_in_the_future
    validate :harvest_date_cannot_be_in_the_past
    validate :leasing_end_date_cannot_be_in_the_past
    has_many :notes, as: :noteable, dependent: :destroy
    belongs_to :user

    def self.ransackable_associations(auth_object = nil)
      ["notes", "user"]
    end
    def self.ransackable_attributes(auth_object = nil)
    ["name","location_name", "current_crop"]
    end
    def harvest_within_a_week?
      return false unless harvest_date.present?
  
      harvest_date <= Date.today + 7.days
    end 

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

      def leasing_end_date_cannot_be_in_the_past
        if leasing_end_date.present? && leasing_end_date < Date.current
          errors.add(:leasing_end_date, "can't be in the past")
        end
      end
end
