class Comment < ActiveRecord::Base
  include Lazy::Commentable

  belongs_to :commentable, :polymorphic => true
  belongs_to :user
end