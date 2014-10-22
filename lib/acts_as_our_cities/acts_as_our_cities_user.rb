module ActsAsOurCities
  module ActsAsOurCitiesUser
    extend ActiveSupport::Concern

    module ClassMethods
      def acts_as_our_cities_user
        def self.create args={}
          if ActsAsOurCities.api_mode
            ActsAsOurCities::API::User.create args
          else
            super args
          end
        end

        include ActsAsOurCities::ActsAsOurCitiesUser::LocalInstanceMethods
      end
    end

    module LocalInstanceMethods
      def name
        "#{self.first_name} #{self.last_name}"
      end

      def avatar_url
        if self.avatar
          "https://#{ENV['ACCOUNTS_BUCKET']}.s3.amazonaws.com/uploads/user/avatar/#{self.id}/square_#{self.avatar}"
        else
          ActsAsOurCities.default_avatar_url
        end
      end
    end
  end
end

ActiveRecord::Base.send :include, ActsAsOurCities::ActsAsOurCitiesUser
