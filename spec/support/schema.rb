ActiveRecord::Schema.define(:version => 0) do
  create_table :users do |u|
    u.string :name
  end

  create_table :posts do |p|
    p.string :title
    p.text   :body
  end
end