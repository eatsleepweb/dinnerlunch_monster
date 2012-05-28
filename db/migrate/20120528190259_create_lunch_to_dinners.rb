class CreateLunchToDinners < ActiveRecord::Migration
  def self.up
    create_table :lunch_to_dinners do |t|
      t.integer :lunch_id
      t.integer :dinner_id
      t.text :description

      t.timestamps
    end
  end

  def self.down
    drop_table :lunch_to_dinners
  end
end
