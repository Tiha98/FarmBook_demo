class ChangeCowsAttributes < ActiveRecord::Migration[7.1]
  def change
    change_column :cows, :approxcalving, 'date USING CAST(approxcalving AS date)'
    change_column :cows, :lactationstatus, 'boolean USING CAST(lactationstatus AS boolean)'
    change_column :cows, :lastcalvingdate, 'date USING CAST(lastcalvingdate AS date)'
  end
end
