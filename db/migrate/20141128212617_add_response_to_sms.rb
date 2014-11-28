class AddResponseToSms < ActiveRecord::Migration
  def change
    add_column :sms, :response, :string
  end
end
