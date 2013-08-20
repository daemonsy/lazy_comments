class User < ActiveRecord::Base
end


class Post < ActiveRecord::Base
  has_comments
end


class Comment < ActiveRecord::Base
  include Lazy::Commentable
end