class ChangeResponseTypeInSms < ActiveRecord::Migration
  def change
    change_column :sms, :response, :text
  end
end
