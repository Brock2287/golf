class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.integer :idx
      t.string :event_type

      t.timestamps
    end
  end
end
