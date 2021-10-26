class AddCommentsCounterToPosts < ActiveRecord::Migration[6.1]
  def change
    add_column :posts, :comments_counter, :integer, default: 0, null: false
  end
end
