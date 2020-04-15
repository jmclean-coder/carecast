class CreateUserMetrics < ActiveRecord::Migration[6.0]
  def change
    create_table :user_metrics do |t|
      t.references :metric, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
