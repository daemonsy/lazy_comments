require 'active_record'
module Lazy
  module Commentable
    def self.included(comment_model)
      comment_model.extend Finders
      comment_model.scope :owned_by_user, -> (user) { comment_model.where(user: user) }
      comment_model.scope :latest_first,  -> { comment_model.reorder(created_at: :desc) }
    end

    module Finders
      def for_subject(subject)
        where(commentable_type: subject.class.base_class.to_s, commentable_id: subject.id)
      end

      def for_topic(topic)
        where(topic: topic)
      end
    end
  end
end
