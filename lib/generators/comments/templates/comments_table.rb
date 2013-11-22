class CreateComments < ActiveRecord::Migration
  def up
    create_table :comments do |t|
      t.text       :body
      t.references :user, index: true
      t.references :commentable, polymorphic: true
      t.string     :group
      t.string     :topic

      t.timestamps
    end
    add_index :comments, :commentable_type
    add_index :comments, :commentable_id
  end

  def down
    drop_table :comments
  end
end