module ActsAsMinhascidades
  module API
    class User < ActiveResource::Base
      @headers  = { 'Authorization' => "Token token=\"#{ActsAsMinhascidades.api_token}\"" }
      self.site = ActsAsMinhascidades.api_site
    end
  end
end
