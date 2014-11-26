class SmsController < ApplicationController

  def create
    new_sms = Sms.create(
      sms_message_id: params[:SmsMessageSid],
      sms_id: params[:SmsId],
      sms_status: params[:SmsStatus],
      from_city: params[:FromCity],
      body: params[:Body],
      to: params[:To],
      message_sid: params[:MessageSid],
      account_sid: params[:AccountSid],
      from: params[:From],
      api_version: params[:api_version]
    )
  end

end