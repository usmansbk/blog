class AddUserRefToPosts < ActiveRecord::Migration[6.1]
  def change
    add_reference :posts, :user, null: false, foreign_key: { name: "author_id" } 
  end
end
