class AddUserRefToPosts < ActiveRecord::Migration[6.1]
  def change
    add_reference :posts, :user, null: false, foreign_key: true, counter_cache: true
  end
end
