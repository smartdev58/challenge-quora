class UserSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :email, :jti
end
