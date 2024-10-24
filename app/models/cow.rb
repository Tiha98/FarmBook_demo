class Cow < ApplicationRecord
    validates :identificationnumber, presence: true, length: { minimum: 12, maximum: 12 }
    validates :breed, presence: true
    validates :lastcalvingdate, presence: true, if: :lactationstatus?
    validates :fathersementype, presence: true, if: :pregnant?
    validates :approxcalving, presence: true, if: :pregnant?
    validate :validate_approxcalving
    validate :validate_lastvalvingdate
    belongs_to :user
    has_many :notes, as: :noteable, dependent: :destroy

  
    def self.ransackable_associations(auth_object = nil)
      ["notes", "user"]
    end
  def self.ransackable_attributes(auth_object = nil)
    ["approxcalving", "breed", "created_at", "fathersementype", "id", "id_value", "identificationnumber", "lactationstatus", "lastcalvingdate", "pregnancystatus", "updated_at", "user_id"]
  end
    def approx_calving_within_a_week?
      return false unless approxcalving.present?
  
      approxcalving <= Date.today + 7.days
    end

    private
  
    def pregnant?
      pregnancystatus == true
    end
    def validate_lastvalvingdate
      if lastcalvingdate.present? && lastcalvingdate > Date.current
        errors.add(:lastcalvingdate, "can't be in the future")
      end
    end
    def validate_approxcalving
      if approxcalving.present? && approxcalving < Date.current
        errors.add(:approxcalving, "can't be in the past")
      end
    end
  end
  