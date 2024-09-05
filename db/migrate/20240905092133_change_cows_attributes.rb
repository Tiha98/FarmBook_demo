class ChangeCowsAttributes < ActiveRecord::Migration[7.1]
  def change
    change_column :cows, :approxcalving, :date
    change_column :cows, :lactationstatus, :boolean
    change_column :cows, :lastcalvingdate, :date
  end
end
