class CreateMetrics < ActiveRecord::Migration[6.0]
  def change
    create_table :metrics do |t|
      t.integer :water_cup
      t.integer :sleep_hour
      t.integer :work_time
      t.integer :play_time
      t.integer :energy
      t.integer :productivity
      t.integer :motivation
      t.integer :stress
      t.integer :mood

      t.timestamps
    end
  end
end
