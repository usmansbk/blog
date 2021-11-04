# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

5.times do |i|
	user = User.new(name: "User ##{i}", bio: "A bio.", email: "test#{i}@email.com", password: "password", password_confirmation: "password")
	user.skip_confirmation!
	user.save!
	3.times do |j|
		post = user.posts.create!(title: "Post ##{j}", text: "Lorem Ipsum Dolor Amet")
		user.likes.create!(post: post)
		5.times do |k|
			post.comments.create!(text: "Comment ##{k}", user: user)
		end
	end
end
