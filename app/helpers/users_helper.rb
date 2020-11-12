module UsersHelper
  def get_userimage(user)
    default_picture = "user/default_picture.png"
    return user.picture.nil? || !File.exist?("public/#{user.picture.to_s}") ? 
      default_picture : user.picture.to_s
  end
end
