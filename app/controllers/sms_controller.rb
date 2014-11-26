class SmsController < ApplicationController

  def create
    Rails.logger.info("PARAMS: #{params.inspect}")
  end

end