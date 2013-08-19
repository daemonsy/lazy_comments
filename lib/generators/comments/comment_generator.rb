require 'rails/generators/migration'

class CommentGenerator < Rails::Generators::Base
  include Rails::Generators::Migration

  def self.source_root
    @lazy_comments_source_root ||= File.expand_path("../templates", __FILE__)
  end

  def self.next_migration_number(path)
    Time.now.utc.strftime("%Y%m%d%H%M%S")
  end

  def add_controller
    copy_file "controllers/comments_controller.rb", "app/controllers/comments_controller.rb"
  end

  def add_model
    copy_file "models/comment.rb", "app/models/comment.rb"
    migration_template "comments_table.rb", "db/migrate/create_comments.rb"
  end
end