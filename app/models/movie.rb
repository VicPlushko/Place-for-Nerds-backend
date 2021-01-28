class Movie < ApplicationRecord
    has_many :reviews, primary_key: :movie_id
end

