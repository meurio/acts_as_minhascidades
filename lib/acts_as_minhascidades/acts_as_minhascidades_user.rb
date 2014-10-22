module ActsAsMinhascidades
  module ActsAsMinhascidadesUser
    extend ActiveSupport::Concern

    module ClassMethods
      def acts_as_minhascidades_user
        def self.create args={}
          if ActsAsMinhascidades.api_mode
            ActsAsMinhascidades::API::User.create args
          else
            super args
          end
        end

        include ActsAsMinhascidades::ActsAsMinhascidadesUser::LocalInstanceMethods
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
          ActsAsMinhascidades.default_avatar_url
        end
      end
    end
  end
end

ActiveRecord::Base.send :include, ActsAsMinhascidades::ActsAsMinhascidadesUser
