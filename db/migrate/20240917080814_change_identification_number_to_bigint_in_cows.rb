class ChangeIdentificationNumberToBigintInCows < ActiveRecord::Migration[7.1]
  def change
        change_column :cows, :identificationnumber, :bigint
  end
end
