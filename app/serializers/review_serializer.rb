class ReviewSerializer < ActiveModel::Serializer
  attributes :id, :content, :movie_id
  belongs_to :movie
end
