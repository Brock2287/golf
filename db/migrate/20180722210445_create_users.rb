class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name, null: false
      t.string :city, null: false
      t.string :state, null: false
      t.string :bio
      t.timestamps
    end
  end
end
