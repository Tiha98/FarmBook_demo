class Cow < ApplicationRecord
    validates :identificationnumber, presence: true, length: { minimum: 12, maximum: 12 }
    validates :breed, presence: true
    validates :lactationstatus, presence: true
    validates :lastcalvingdate, presence: true
  
    validates :fathersementype, presence: true, if: :pregnant?
    validates :approxcalving, presence: true, if: :pregnant?
    belongs_to :user
  
    private
  
    def pregnant?
      pregnancystatus == true
    end
  end
  