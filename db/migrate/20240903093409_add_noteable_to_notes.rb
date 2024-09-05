class AddNoteableToNotes < ActiveRecord::Migration[7.1]
  def change
    add_reference :notes, :noteable, polymorphic: true, null: true
  end
end
