class Review < ApplicationRecord
    belongs_to :movie, primary_key: :movie_id
end
