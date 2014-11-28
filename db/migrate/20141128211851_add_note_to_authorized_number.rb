class AddNoteToAuthorizedNumber < ActiveRecord::Migration
  def change
    add_column :authorized_numbers, :note, :string
  end
end
