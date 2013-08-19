module Lazy
  module Comments
    def self.included(subject)
      subject.extend ClassMethods
    end

    module ClassMethods
      def has_comments(*args)
        has_many :comments, as: :commentable, dependent: :destroy
      end
    end
  end
end
ActiveRecord::Base.send(:include, Lazy::Comments)