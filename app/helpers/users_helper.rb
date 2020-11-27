module UsersHelper
  def get_userimage(user)
    default_picture = "user/default_picture.png"
    return !user.picture? || !File.exist?(user.picture.path) ?
             default_picture : user.picture.url
  end
end
