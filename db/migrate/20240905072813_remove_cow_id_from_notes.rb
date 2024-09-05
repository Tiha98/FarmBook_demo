class RemoveCowIdFromNotes < ActiveRecord::Migration[7.1]
  def change
    remove_column :notes, :cow_id, :integer
  end
end
