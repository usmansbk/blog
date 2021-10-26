class AddPostRefToComments < ActiveRecord::Migration[6.1]
  def change
    add_reference :comments, :post, null: false, foreign_key: true, counter_cache: true
  end
end
