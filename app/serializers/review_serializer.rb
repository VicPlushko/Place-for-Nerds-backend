class ReviewSerializer < ActiveModel::Serializer
  attributes :id, :title, :content, :movie_id, :user_id
end
