class Movie < ActiveRecord::Base
  def self.all_ratings
    Movie.select('DISTINCT rating').map(&:rating).sort #order('rating ASC')
  end

  def self.with_ratings(ratings_list)
    return Movie.all if ratings_list == nil || ratings_list.size == 0
    Movie.where("rating IN (?)", ratings_list)
  end
end
