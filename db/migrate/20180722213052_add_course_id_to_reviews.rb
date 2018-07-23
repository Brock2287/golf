class AddCourseIdToReviews < ActiveRecord::Migration[5.2]
  def change
    add_column :reviews, :course_id, :integer
  end
end
