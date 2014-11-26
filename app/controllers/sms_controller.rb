class SmsController < ApplicationController

  def create
    new_sms = Sms.new(
      sms_message_sid: params[:SmsMessageSid],
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

    if new_sms.save
      reply_text = new_sms.reply
    end

    render text: reply_text
  end

  def index 
    new_sms = Sms.new(
      sms_message_sid: params[:SmsMessageSid],
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

    if new_sms.save
      reply_text = new_sms.reply
    end

    render text: reply_text
  end

end