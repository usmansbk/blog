class AddLikesCounterToPosts < ActiveRecord::Migration[6.1]
  def change
    add_column :posts, :likes_counter, :integer, default: 0, null: false
  end
end
