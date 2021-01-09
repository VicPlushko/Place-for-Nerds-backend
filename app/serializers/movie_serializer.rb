class MovieSerializer < ActiveModel::Serializer
  attributes :id, :title, :release_date, :synopsis, :poster, :actor_id, :genre
end
