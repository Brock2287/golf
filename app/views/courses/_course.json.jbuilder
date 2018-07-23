json.extract! course, :id, :name, :description, :city, :state, :difficulty, :rating_pts_earned, :rating_pts_possible, :image, :created_at, :updated_at
json.url course_url(course, format: :json)
