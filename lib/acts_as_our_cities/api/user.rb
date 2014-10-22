module ActsAsOurCities
  module API
    class User < ActiveResource::Base
      self.include_root_in_json = true

      def self.headers
        { 'Authorization' => "Token token=\"#{ActsAsOurCities.api_token}\"" }
      end

      def self.site
        self.site = ActsAsOurCities.api_site
        super
      end
    end
  end
end
