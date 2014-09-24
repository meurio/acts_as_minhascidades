module ActsAsMinhascidades
  def self.config
    { default_avatar_url: "http://i.imgur.com/7XqAySb.png" }
  end

  module ActsAsMinhascidadesUser
    extend ActiveSupport::Concern

    module ClassMethods
      def acts_as_minhascidades_user
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
          ActsAsMinhascidades.config[:default_avatar_url]
        end
      end
    end
  end
end

ActiveRecord::Base.send :include, ActsAsMinhascidades::ActsAsMinhascidadesUser
