require 'rspec'
require "support/active_record"
require "support/lazy_comments"



ActiveRecord::Migration.verbose = false
ActiveRecord::Base.establish_connection(adapter: "sqlite3", database: ":memory:")

ActiveRecord::Migrator.up "db/migrate"

def load_existing_schema
  load "support/schema.rb"
end

def file_path(file)
  File.expand_path(File.dirname(__FILE__) + "/../#{file}")
end

def setup_models
  load "support/models.rb"
end

def install_gem
  require File.expand_path(File.dirname(__FILE__) + "/../lib/generators/comments/templates/comments_table.rb")
  CreateComments.new.up
end

describe "Lazy Comment" do
  load_existing_schema
  install_gem
  setup_models

  describe "#has_comments" do
    it "creates comments on the associated model" do
      post    = Post.create(title: "Disney Star Wars???", body: "WATTTTT")
      comment = post.comments.build(message: "I sincerely hope they don't screw it up")

      expect(comment.commentable_id).to eq post.id
      expect(comment.commentable_type).to eq "Post"
    end
  end

  describe "Lazy::Commentable" do
    context "Finders" do
      describe "#for_subject" do
        it "finds comments for a given AR model" do
          vader_dies = Post.create(title: "Darth Vader dies", body: "The rumor mill says he was electrocuted")
          comment    = vader_dies.comments.create(message: "Hopefully not by a old wrinkly man")

          comments = Comment.for_subject(vader_dies)
          expect(comments).to include(comment)
          expect(comments.size).to eq 1
        end
      end
      describe "#in_groups" do
        before(:each) do
          @dorian_gray = Post.create(title: "A picture of Dorian Gray", body: "The story goes...")
          haters      = @dorian_gray.comments.create(message: "lovely story", group: "haters")
          fans        = @dorian_gray.comments.create(message: "lovely story", group: :fans)
        end

        it "filters by group" do
          haters_comments = @dorian_gray.comments.in_group(:haters)
          expect(haters_comments.size).to eq 1
        end
      end
    end
  end
end
