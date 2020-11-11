module UsersHelper
  def get_userimage(user)
    default_picture = "user/default_picture.png"
    return user.picture.nil? ? default_picture : "user/#{user.picture}"
  end
end
