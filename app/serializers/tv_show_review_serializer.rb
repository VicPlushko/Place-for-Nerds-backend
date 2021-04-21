class TvShowReviewSerializer < ActiveModel::Serializer
  attributes :id, :title, :content, :show_id, :user_id
end
