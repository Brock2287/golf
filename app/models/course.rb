class Course < ApplicationRecord
  mount_uploader :image, ImageUploader

  has_many :reviews

  def rating
    unless rating_pts_possible.nil? || rating_pts_possible == 0
      return ((rating_pts_earned / rating_pts_possible.to_f) * 5).round
    else
      return "No Rating"
    end
  end

end
