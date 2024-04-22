class UserSerializer
  include JSONAPI::Serializer
  attributes :email, :api_key

  def self.format_data(user)
    {
      data: {
        type: "users",
        id: user.id,
        attributes: {
          email: user.email,
          api_key: user.auth_token
        }
      }
    }
  end
end
