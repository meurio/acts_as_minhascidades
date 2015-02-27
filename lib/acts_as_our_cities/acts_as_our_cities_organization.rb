module ActsAsOurCities
  module ActsAsOurCitiesOrganization
    extend ActiveSupport::Concern

    module ClassMethods
      def acts_as_our_cities_organization
        include ActsAsOurCities::ActsAsOurCitiesOrganization::LocalInstanceMethods
      end
    end

    module LocalInstanceMethods
      def avatar_url
        "https://#{ENV['ACCOUNTS_BUCKET']}.s3.amazonaws.com/uploads/organization/avatar/#{self.id}/square_#{self.avatar}"
      end
    end
  end
end

ActiveRecord::Base.send :include, ActsAsOurCities::ActsAsOurCitiesOrganization
