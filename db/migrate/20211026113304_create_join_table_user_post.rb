class CreateJoinTableUserPost < ActiveRecord::Migration[6.1]
  def change
    create_join_table :users, :posts, column_options: { null: true }, table_name: :likes do |t|
      t.index [:author_id, :post_id]
      # t.index [:post_id, :user_id]

      t.timestamps
    end
  end
end
