class CreateCows < ActiveRecord::Migration[7.1]
  def change
    create_table :cows do |t|
      t.integer :identificationnumber
      t.string :breed
      t.string :lactationstatus
      t.string :lastcalvingdate
      t.boolean :pregnancystatus
      t.string :fathersementype
      t.string :approxcalving

      t.timestamps
    end
  end
end
