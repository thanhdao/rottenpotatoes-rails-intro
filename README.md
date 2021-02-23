# RottenPotatoes demo app: getting started

This app is associated with the free [online
course](http://www.saas-class.org) and (non-free)
[ebook](http://www.saasbook.info) Engineering Software as a Service.

To start working on the Rails Intro homework, please follow [the instructions](instructions/README.md).

hw-associations-reviews


rails generate model Moviegoer name:string provider:string uid:string

class Moviegoer < ActiveRecord::Base
  def self.create_with_omniauth(auth)
    Moviegoer.create!(
      :provider => auth["provider"],
      :uid => auth["uid"],
      :name => auth["info"]["name"])
  end
end