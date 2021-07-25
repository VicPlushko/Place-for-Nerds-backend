class TvShowReview < ApplicationRecord
    validates :title, :content, presence: true
end
