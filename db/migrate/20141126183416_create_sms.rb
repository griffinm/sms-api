class CreateSms < ActiveRecord::Migration
  def change
    create_table :sms do |t|
      t.string :sms_message_sid
      t.string :sms_id
      t.string :sms_status
      t.string :from_city
      t.string :body
      t.string :to
      t.string :message_sid
      t.string :account_sid
      t.string :from
      t.string :api_version

      t.timestamps
    end
  end
end
