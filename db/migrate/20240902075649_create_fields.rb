class CreateFields < ActiveRecord::Migration[7.1]
  def change
    create_table :fields do |t|
      t.string :name
      t.string :location_name
      t.float :location_latitude
      t.float :location_longitude
      t.string :current_crop
      t.date :sowing_date
      t.date :harvest_date
      t.float :size
      t.boolean :fertilizer
      t.string :fertilizer_type
      t.text :fertilizer_usage
      t.boolean :leased
      t.date :leasing_end_date

      t.timestamps
    end
  end
end
