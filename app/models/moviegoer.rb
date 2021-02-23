class Moviegoer < ActiveRecord::Base
  has_many :reviews
  has_many :movies, :through => :reviews
  def self.create_with_omniauth(auth)
    Moviegoer.create!(
      :provider => auth["provider"],
      :uid => auth["uid"],
      :name => auth["info"]["name"])
  end
  def self.find_or_create_from_auth_hash(auth)
    Moviegoer.find_by(provider: auth["provider"], uid: auth["uid"]) ||
           Moviegoer.create_with_omniauth(auth)
  end
end
