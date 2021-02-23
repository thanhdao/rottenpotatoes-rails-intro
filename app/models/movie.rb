class Movie < ActiveRecord::Base
  has_many :reviews
  
  def self.all_ratings
    select('DISTINCT rating').map(&:rating).sort #order('rating ASC')
  end

  def self.with_ratings(ratings_list)
    return self.all if ratings_list == nil || ratings_list.size == 0
    # byebug
    where("rating IN (?)", ratings_list)
  end

end
