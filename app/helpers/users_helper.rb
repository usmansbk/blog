module UsersHelper
  def get_photo(user)
    user.photo.present? ? user.photo : 'https://via.placeholder.com/150'
  end
end
