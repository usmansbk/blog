class AddUserRefToComments < ActiveRecord::Migration[6.1]
  def change
    add_reference :comments, :user, null: false, foreign_key: { name: "author_id" }
  end
end
