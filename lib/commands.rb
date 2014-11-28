class Commands

  def self.command_name
    'commands'
  end

  def self.matcher
    /^commands$/
  end

  def self.response(params={})
    message = "Commands:\n"
    SmsResponse.command_array.each do |command|
      message += "#{command}\n"
    end

    return message
  end

end
