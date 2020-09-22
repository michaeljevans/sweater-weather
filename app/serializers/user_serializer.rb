class UserSerializer
  def self.serialize_me_captain(user)
    {
      data: {
        id: user.id,
        type: 'user',
        attributes: {
          email: user.email,
          api_key: user.api_key
        }
      }
    }
  end
end
