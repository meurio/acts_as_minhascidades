module ActsAsOurCities
  module API
    class User < ActiveResource::Base
      @headers  = { 'Authorization' => "Token token=\"#{ActsAsOurCities.api_token}\"" }
      self.site = ActsAsOurCities.api_site
    end
  end
end
