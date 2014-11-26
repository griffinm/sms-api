class CreateAuthorizedNumbers < ActiveRecord::Migration
  def change
    create_table :authorized_numbers do |t|
      t.string :phone_number

      t.timestamps
    end
  end
end
