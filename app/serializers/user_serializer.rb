class UserSerializer
  def self.serialize_me_captain(user)
    {
      data: {
        type: 'users',
        id: user.id,
        attributes: {
          email: user.email,
          api_key: user.api_key
        }
      }
    }
  end
end
