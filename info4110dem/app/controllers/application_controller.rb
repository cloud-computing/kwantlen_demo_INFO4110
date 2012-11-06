class ApplicationController < ActionController::Base
  protect_from_forgery

  def authorize
    
    config = YAML.load_file(File.join(::Rails.root, 'config', 'databasedotcom.yml'))
    client = Databasedotcom::Client.new(config)

    username = 'reecemarkowsky@reece.com'
	password = 'thehip12wDAC1NVd5lkrCvSKIMPvLtsVn'
    client.authenticate :username => username, :password => password
    
    return client
    
  end
end