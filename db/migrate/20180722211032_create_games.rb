class CreateGames < ActiveRecord::Migration[5.2]
  def change
    create_table :games do |t|
      t.belongs_to :user, foreign_key: true
      t.references :course, foreign_key: true
      t.datetime :gamedatetime
      t.integer :score
      t.timestamps
    end
  end
end
