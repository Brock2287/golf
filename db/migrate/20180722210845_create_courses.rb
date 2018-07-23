class CreateCourses < ActiveRecord::Migration[5.2]
  def change
    create_table :courses do |t|
      t.string :name, null: false
      t.string :city, null: false
      t.string :state, null: false
      t.string :description, null: false
      t.string :difficulty, null: false
      t.timestamps
    end
  end
end
