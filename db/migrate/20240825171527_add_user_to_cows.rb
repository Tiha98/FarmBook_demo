class AddUserToCows < ActiveRecord::Migration[7.1]
  def change
    add_reference :cows, :user, null: false, foreign_key: true
  end
end
