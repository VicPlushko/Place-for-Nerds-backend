class UserSerializer < ActiveModel::Serializer
    attributes :username, :email, :password, :review_id
  end
  