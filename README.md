# SMS-API
This application will be used as a gateway to receive Twillio messages and respond to them based on the logic of a number of internal modules. This application will only respond to phone numbers that are stored in the authorized_numbers table

## Adding a module
Add a class to the /lib folder which includes the following methods:

```ruby
class NewModule
  
  # This should return a regular expression
  def self.matcher

  end

  # This is the text that will be sent in reply to the incoming SMS if the regular expression provided in the matcher class matches the incoming SMS. This returns a basic string that is automatically converted to Twilio XML
  def self.response

  end

  # The name of the command for the help listing
  def self.command_name

  end
end
```

## Deployment
For the base set of modules, the following environment variables are required:
* MYSQL_PASSWORD
* SECRET_KEY_BASE
* TWILIO_ACCOUNT_SID
* TWILIO_AUTH_TOKEN
* DEVISE_SECRET_KEY
* NEW_RELIC_KEY
* FORECAST_API_KEY