module UsersHelper
  def get_photo(user)
    user.photo.present? ? user.photo : "https://ui-avatars.com/api/?name=#{user.name}&background=random"
  end
end
