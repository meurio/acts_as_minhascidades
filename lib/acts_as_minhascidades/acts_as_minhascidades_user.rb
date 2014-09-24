module ActsAsMinhascidades
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
    end
  end
end

ActiveRecord::Base.send :include, ActsAsMinhascidades::ActsAsMinhascidadesUser
