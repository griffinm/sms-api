class HealthController < ApplicationController

	def index
    current_time = Time.now.utc
    app_name = 'sms-api'
    app_status = true
    message = "application is functioning"

    render json: {
      currentTime: current_time,
      appName: app_name,
      appStatus: app_status,
      message: message
    }
	end

end