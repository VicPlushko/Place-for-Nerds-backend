class MovieSerializer < ActiveModel::Serializer
  attributes :id, :title, :release_date, :synopsis, :poster, :actor, :genre, :crew
end
