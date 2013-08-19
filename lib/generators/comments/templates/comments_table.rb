class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text       :message
      t.references :user, index: true
      t.references :commentable, polymorphic: true
      t.string     :groups
      t.string     :mentions

      t.timestamps
    end
    add_index :comments, :commentable_type
    add_index :comments, :commentable_id
    add_index :comments, :user_id
  end
end